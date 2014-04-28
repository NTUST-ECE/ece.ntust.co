console.log 'hi'

waitForFinalEvent = (->
  timers = {}
  (callback, ms, uniqueId) ->
    uniqueId = "Don't call this twice without a uniqueId"  unless uniqueId
    clearTimeout timers[uniqueId] if timers[uniqueId]
    timers[uniqueId] = setTimeout(callback, ms)
    return
)()

# 針對不同瀏覽器及系統的處理
if window.chrome
  isChrome = true
  $('body').addClass 'chrome'
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

  $("code").each ->
    $(this).html $(this).html().replace(/\n/g, "<br />")

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
  # 重新調整基線旋律
  refreshBaseline()
  # 為包著圖片的元素加上 class
  $('.content p:has(img), .content div:has(img)').addClass 'img'

refreshViev()

# on load !
$(window).load ->
  refreshViev()

$(window).resize ->
  waitForFinalEvent (->
    refreshViev()
  ), 500, "winRz"
