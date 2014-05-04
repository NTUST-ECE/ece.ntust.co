console.log 'hi'

this.waitForFinalEvent = (->
  timers = {}
  (callback, ms, uniqueId) ->
    uniqueId = "Don't call this twice without a uniqueId"  unless uniqueId
    clearTimeout timers[uniqueId] if timers[uniqueId]
    timers[uniqueId] = setTimeout(callback, ms)
    return
)()

showHero = (id) ->
  # $('.hero .item').css 'display', 'none'
  $('.hero .item:nth-child(' + id + ')').css? 'opacity', '0'
  $('.hero .item:nth-child(' + id + ')').css? 'display', 'block'
  link = $('.hero .item:nth-child(' + id + ')').attr? 'data-link'
  if link != ''
    $('#hero-trigger').attr 'href', link
    $('#hero-trigger').attr 'target', '_blank'
  else
    $('#hero-trigger').attr 'href', '#'
    $('#hero-trigger').attr 'target', ''
  setTimeout ->
    $('.hero .item:nth-child(' + id + ')').css? 'opacity', 'auto'
  , 10

refreshBaseline = () ->
  # set baseline for vertical rhythm
  vrLineHeight = $('.vertical-rhythm > p').css 'line-height'
  vrLineHeight = parseInt(vrLineHeight, 10);
  # $('.vertical-rhythm img').baseline vrLineHeight
  $('.vertical-rhythm div').baseline vrLineHeight if vrLineHeight
  $('.vertical-rhythm p').baseline vrLineHeight if vrLineHeight

refreshViev = () ->
  # 螢幕太大不要露內褲
  cmh = $(window).height() - $('header').height() - $('footer').height()
  nvh = $('.main-menu').height() + 18
  cmh = nvh if cmh < nvh
  $('.content').css 'min-height', cmh
  # 如果 pull-right 撞上 Nav ...
  navBottomPosition = $('.main-menu').offset().top + $('.main-menu').height()
  $('.pull-left').each ->
    if $(this).offset().top < navBottomPosition + 100
      $(this).addClass('not-raised')
    else
      $(this).removeClass('not-raised')
  # 重新調整基線旋律
  refreshBaseline()
  # 為包著圖片的元素加上 class
  $('.content p:has(img), .content div:has(img)').addClass 'img'
  # CSS3 Fallbacks (Modernizr feature-detects include 在 modernizr.js)
  if not Modernizr.cssvwunit
    1
  # ...

refreshViev()

# 針對不同瀏覽器及系統的處理
if window.chrome
  isChrome = true
  $('body').addClass 'chrome'
if Modernizr.touch
  isTouch = true
  $('body').addClass 'touch'
else
  $('body').addClass 'non-touch'
if navigator.platform.toUpperCase().indexOf('MAC')>=0
  isMac = true
  $('body').addClass 'mac'
if navigator.platform.match(/(iPhone|iPod|iPad)/i)
  isIOS = true
  $('body').addClass 'ios'
if navigator.appVersion.match(/(Win)/i)
  isWin = true
  $('body').addClass 'windows'

$(document).ready ->
  # lazyload all images
  llThreshold = (if isIOS then 5000 else 0)
  $(".lazyload").show()
  $("img").lazyload
    effect: "fadeIn"
    threshold: llThreshold
    failure_limit: 10

  # 隨機顯示一張 Hero
  heroItems = $('.hero .item')
  showHero(parseInt((Math.random()*10000)%heroItems.length+1));

  # Code block
  $("code").each ->
    $(this).html $(this).html().replace(/\n/g, "<br />")

# on load !
$(window).load ->
  refreshViev()

$(window).resize ->
  waitForFinalEvent (->
    refreshViev()
  ), 500, "winRz"
