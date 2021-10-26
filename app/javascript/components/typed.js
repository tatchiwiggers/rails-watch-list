import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Save your favorite movies lists here!"],
    typeSpeed: 80,
    loop: true
  });
}

export { loadDynamicBannerText };