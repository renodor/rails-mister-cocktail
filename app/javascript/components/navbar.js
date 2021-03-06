import Typed from 'typed.js';

// const DynamicInputText = () => {
//   new Typed('#banner-typed-text', {
//     strings: ["Change your life", "Learn to code"],
//     typeSpeed: 50,
//     loop: true
//   });
// }

const DynamicInputText = () => {
 new Typed('#banner-typed-text', {
    strings: ['Mojito', 'Cuba Libre', 'Sex on the Beach', 'Gin Tonic'],
    typeSpeed: 100,
    backSpeed: 75,
    attr: 'placeholder',
    bindInputFocusEvents: true,
    loop: true
  });
}

const createButton = document.querySelector('.create-button');

window.setInterval(function(){
  createButton.classList.toggle("rotate-center");
}, 1800);

export { DynamicInputText };
