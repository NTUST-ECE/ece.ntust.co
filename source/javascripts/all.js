//= require jquery/dist/jquery.js
//= require fastclick/lib/fastclick.js
//= require Han/js/han.js
//= require macho.js
//= require foundation/js/foundation.js
//= require baseline.js
//= require jquery.lazyload/jquery.lazyload
//= require fancybox/source/jquery.fancybox.pack
// An licence is required to use fancyBox for commercial websites
//= include app.js

// foundation

$(document).foundation();

// FastClick

window.addEventListener('load', function() {
  FastClick.attach(document.body);
}, false);

// macho.js

$('.content p').macho();

// fancyBox

$("a.lightbox").fancybox({
  // openEffect  : 'elastic',
  // closeEffect : 'elastic',
  helpers : {
    title : {
      type : 'outside'
    }
  }
});
