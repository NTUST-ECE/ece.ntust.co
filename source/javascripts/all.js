//= require jquery/dist/jquery.js
//= require Han/js/han.js
//= require foundation/js/foundation.js
//= require fastclick/lib/fastclick.js
//= require macho.js
//= include app.js

$(document).foundation();

window.addEventListener('load', function() {
    FastClick.attach(document.body);
}, false);


$('p').macho();
