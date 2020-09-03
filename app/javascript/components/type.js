import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["1 month", "30 days", "720 hours"],
    typeSpeed: 80,
    loop: true
  });
}

export { loadDynamicBannerText };
