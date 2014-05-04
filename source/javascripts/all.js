//= require jquery/dist/jquery.js
//= require fastclick/lib/fastclick.js
//= require Han/js/han.js
//= require macho.js
//= require foundation/js/foundation.js
//= require baseline.js
//= require jquery.lazyload/jquery.lazyload
//= include app.js

// foundation

$(document).foundation();

// FastClick

window.addEventListener('load', function() {
    FastClick.attach(document.body);
}, false);

// macho.js

$('.content p').macho();

// justfont

// var jfTextElements = 'h1, h2, h3, h4, h5, h6, p, blockquote, a, code, dl, ol, ul';


// $(jfTextElements).css('opacity', '0');


// function resetHPOpacity() {
//   $(jfTextElements).each(function () {
//     $(this).css('opacity', '');
//   });
// }

// _jf.push(['_eventActived',function () {
//   resetHPOpacity();
// }]);

// _jf.push(['_eventInactived',function () {
//   console.warn("justfont failed");
//   resetHPOpacity();
// }]);
