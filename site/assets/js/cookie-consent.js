/**
 * CookieConsent — bannière RGPD (Tout accepter / Nécessaire uniquement / Personnaliser)
 *
 * Stockage localStorage['cookie_consent'] = { ads: true|false, decided_at: <ISO> }
 * Aucune donnée sensible stockée — uniquement un choix de préférence.
 */
const CONSENT_KEY = 'cookie_consent';

const CookieConsent = {

  /** @returns {{ads: boolean, decided_at: string}|null} */
  getStatus() {
    try {
      const raw = localStorage.getItem(CONSENT_KEY);
      return raw ? JSON.parse(raw) : null;
    } catch {
      return null;
    }
  },

  /** @param {string} category — ex: 'ads' */
  isAllowed(category) {
    return this.getStatus()?.[category] === true;
  },

  _save(prefs) {
    const value = { ...prefs, decided_at: new Date().toISOString() };
    try { localStorage.setItem(CONSENT_KEY, JSON.stringify(value)); } catch { /* ignore */ }
    return value;
  },

  init(onDecided) {
    const banner = document.getElementById('cookie-consent');
    const modal  = document.getElementById('cookie-consent-modal');
    const toggleAds = document.getElementById('cookie-consent-toggle-ads');

    if (this.getStatus() === null && banner) {
      banner.hidden = false;
    }

    const closeAll = () => {
      if (banner) banner.hidden = true;
      if (modal)  modal.classList.add('hidden');
    };

    document.getElementById('cookie-consent-accept-all')?.addEventListener('click', () => {
      this._save({ ads: true });
      closeAll();
      onDecided?.();
    });

    document.getElementById('cookie-consent-necessary')?.addEventListener('click', () => {
      this._save({ ads: false });
      closeAll();
      onDecided?.();
    });

    document.getElementById('cookie-consent-customize')?.addEventListener('click', () => {
      if (toggleAds) toggleAds.checked = this.getStatus()?.ads === true;
      if (modal) modal.classList.remove('hidden');
    });

    modal?.addEventListener('click', (e) => {
      if (e.target === modal) modal.classList.add('hidden');
    });

    document.getElementById('cookie-consent-save')?.addEventListener('click', () => {
      this._save({ ads: !!toggleAds?.checked });
      closeAll();
      onDecided?.();
    });
  },
};
