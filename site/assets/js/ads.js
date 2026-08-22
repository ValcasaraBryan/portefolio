/**
 * Ads — chargement et rendu des encarts publicitaires tiers.
 *
 * Ne charge jamais rien avant consentement explicite (CookieConsent.isAllowed('ads')).
 * Construit exclusivement des nœuds DOM via createElement/setAttribute à partir de
 * champs déjà validés côté serveur (re-validation défensive côté client) — jamais
 * d'innerHTML avec du contenu externe, jamais de HTML brut stocké en base.
 */
const AD_MAX_VISIBLE_SLOTS = 4;

const Ads = {
  _loaded: false,

  /** Remplit #ad-slot-sidebar (jusqu'à AD_MAX_VISIBLE_SLOTS encarts empilés)
   *  si le consentement pub est accordé. Sans effet sinon. */
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

    const chosen = AppUtils.pickWeightedAdSlots(slots, AD_MAX_VISIBLE_SLOTS);
    if (!chosen.length) return;

    container.innerHTML = ''; // sûr : aucune donnée externe n'est injectée ici, uniquement des nœuds DOM ci-dessous
    for (const slot of chosen) {
      const card = document.createElement('div');
      card.className = 'content-aside__ad-card';

      const label = document.createElement('p');
      label.className = 'content-aside__ad-label';
      label.textContent = 'Sponsorisé';
      card.appendChild(label);

      const body = document.createElement('div');
      if (slot.width)  body.style.width  = `${slot.width}px`;
      if (slot.height) body.style.height = `${slot.height}px`;
      card.appendChild(body);

      const rendered = this._render(body, slot);
      if (rendered) container.appendChild(card);
    }
    this._loaded = true;
  },

  /** @returns {boolean} true si un encart a effectivement été inséré dans `container`. */
  _render(container, slot) {
    switch (slot.provider) {
      case 'revive_iframe': return this._renderReviveIframe(container, slot);
      case 'revive_js':     return this._renderReviveJs(container, slot);
      case 'adsense':       return this._renderAdsense(container, slot);
      default: return false;
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
    if (!origin) return false;

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
    return true;
  },

  _renderReviveJs(container, slot) {
    const origin = this._validReviveOrigin(slot);
    if (!origin) return false;
    if (!this._isValidReviveAsyncId(slot.revive_async_id)) return false;

    const ins = document.createElement('ins');
    ins.className = 'revive-zone';
    ins.setAttribute('data-revive-zoneid', String(slot.revive_zone_id));
    ins.setAttribute('data-revive-id', String(slot.revive_async_id));
    container.appendChild(ins);

    const script = document.createElement('script');
    script.async = true;
    script.src = `${origin}/www/delivery/asyncjs.php`;
    container.appendChild(script);
    return true;
  },

  _renderAdsense(container, slot) {
    const client = String(slot.adsense_client_id ?? '');
    const adSlot = String(slot.adsense_slot_id ?? '');
    if (!this._isValidAdsenseClientId(client) || !this._isValidAdsenseSlotId(adSlot)) return false;

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
    return true;
  },
};
