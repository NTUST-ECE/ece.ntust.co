/*!
* Baseline.js 1.0
*
* Copyright 2013, Daniel Eden http://daneden.me
* Released under the WTFPL license
* http://sam.zoy.org/wtfpl/
*
* Date: Sat August 04 23:47:00 2013 GMT
*/
!function(e,t){"use strict";var n=function(){function t(e){if(e){var t,n,r=e.offsetHeight;for(var f in o)t=f,document.body.clientWidth>t&&t>=n&&(i=o[f],n=t);e.style.marginBottom=i-r%i+"px"}}function n(n){t(n),"addEventListener"in e?e.addEventListener("resize",function(){t(n)},!1):"attachEvent"in e&&e.attachEvent("resize",function(){t(n)})}var i=0,o={};return function(e,t){var r="string"==typeof e?document.querySelectorAll(e):e,f=r.length;if("number"==typeof t)i=parseInt(t,10);else if("object"==typeof t){var a=parseInt(getComputedStyle(document.body,null).getPropertyValue("font-size"),10);for(var s in o){var u=/\d+em/.test(s)?parseInt(s,10)*a:/\d+px/.test(s)?parseInt(s,10):s;o[u]=parseInt(o[s],10)}}if(f>1)for(;f--;)n(r[f]);else n(r[0])}}();"undefined"!=typeof t?t.extend(t.fn,{baseline:function(e){return n(this,e)}}):e.baseline=n}(window,window.jQuery||window.Zepto||void 0);