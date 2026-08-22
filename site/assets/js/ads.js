/**
 * Ads — chargement et rendu des encarts publicitaires tiers.
 *
 * Ne charge jamais rien avant consentement explicite (CookieConsent.isAllowed('ads')).
 * Construit exclusivement des nœuds DOM via createElement/setAttribute à partir de
 * champs déjà validés côté serveur (re-validation défensive côté client) — jamais
 * d'innerHTML avec du contenu externe, jamais de HTML brut stocké en base.
 */
const Ads = {
  _loaded: false,

  /** Rempli #ad-slot-sidebar si le consentement pub est accordé. Sans effet sinon. */
  async maybeLoad() {
    if (this._loaded) return;
    if (!CookieConsent.isAllowed('ads')) return;

    const container = document.getElementById('ad-slot-sidebar');
    if (!container) return;

    let slots;
    try {
      const res = await fetch(`${API}/ad_slots.php?placement=sidebar`);
      if (!res.ok) return;
      slots = await res.json();
    } catch {
      return;
    }

    const chosen = AppUtils.pickWeightedAdSlot(slots);
    if (!chosen) return;

    this._render(container, chosen);
    this._loaded = true;
  },

  _render(container, slot) {
    container.innerHTML = ''; // sûr : aucune donnée externe n'est injectée ici, uniquement des nœuds DOM ci-dessous
    if (slot.width)  container.style.width  = `${slot.width}px`;
    if (slot.height) container.style.height = `${slot.height}px`;

    switch (slot.provider) {
      case 'revive_iframe': return this._renderReviveIframe(container, slot);
      case 'revive_js':     return this._renderReviveJs(container, slot);
      case 'adsense':       return this._renderAdsense(container, slot);
      default: return;
    }
  },

  /* ── Validation défensive (pure, testable) ─────────────────
   * Duplique les contraintes déjà appliquées côté serveur (ad_slots.php) —
   * échec silencieux (pas de rendu) plutôt que de faire confiance à l'API. */
  _isValidReviveZoneId(zoneId)    { return /^\d{1,10}$/.test(String(zoneId ?? '')); },
  _isValidReviveAsyncId(asyncId)  { return /^[a-f0-9]{16,64}$/i.test(String(asyncId ?? '')); },
  _isValidAdsenseClientId(client) { return /^ca-pub-\d{10,20}$/.test(String(client ?? '')); },
  _isValidAdsenseSlotId(slotId)   { return /^\d{6,15}$/.test(String(slotId ?? '')); },

  _validReviveOrigin(slot) {
    if (!this._isValidReviveZoneId(slot.revive_zone_id)) return null;
    try {
      const url = new URL(slot.revive_server_url);
      return url.protocol === 'https:' ? url.origin : null;
    } catch {
      return null;
    }
  },

  _renderReviveIframe(container, slot) {
    const origin = this._validReviveOrigin(slot);
    if (!origin) return;

    const iframe = document.createElement('iframe');
    iframe.src = `${origin}/www/delivery/afr.php?zoneid=${encodeURIComponent(slot.revive_zone_id)}&cb=${Date.now()}`;
    if (slot.width)  iframe.width  = String(slot.width);
    if (slot.height) iframe.height = String(slot.height);
    iframe.loading = 'lazy';
    iframe.referrerPolicy = 'no-referrer-when-downgrade';
    iframe.title = 'Advertisement';
    iframe.setAttribute('scrolling', 'no');
    iframe.setAttribute('sandbox', 'allow-scripts allow-same-origin allow-popups allow-popups-to-escape-sandbox');
    iframe.style.border = '0';
    container.appendChild(iframe);
  },

  _renderReviveJs(container, slot) {
    const origin = this._validReviveOrigin(slot);
    if (!origin) return;
    if (!this._isValidReviveAsyncId(slot.revive_async_id)) return;

    const ins = document.createElement('ins');
    ins.className = 'revive-zone';
    ins.setAttribute('data-revive-zoneid', String(slot.revive_zone_id));
    ins.setAttribute('data-revive-id', String(slot.revive_async_id));
    container.appendChild(ins);

    const script = document.createElement('script');
    script.async = true;
    script.src = `${origin}/www/delivery/asyncjs.php`;
    container.appendChild(script);
  },

  _renderAdsense(container, slot) {
    const client = String(slot.adsense_client_id ?? '');
    const adSlot = String(slot.adsense_slot_id ?? '');
    if (!this._isValidAdsenseClientId(client) || !this._isValidAdsenseSlotId(adSlot)) return;

    if (!document.querySelector('script[data-adsbygoogle-loader]')) {
      const loader = document.createElement('script');
      loader.async = true;
      loader.crossOrigin = 'anonymous';
      loader.src = `https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=${encodeURIComponent(client)}`;
      loader.setAttribute('data-adsbygoogle-loader', '1');
      document.head.appendChild(loader);
    }

    const ins = document.createElement('ins');
    ins.className = 'adsbygoogle';
    ins.style.display = 'block';
    ins.setAttribute('data-ad-client', client);
    ins.setAttribute('data-ad-slot', adSlot);
    container.appendChild(ins);

    (window.adsbygoogle = window.adsbygoogle || []).push({});
  },
};
