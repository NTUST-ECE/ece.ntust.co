console.log 'hi'

waitForFinalEvent = (->
  timers = {}
  (callback, ms, uniqueId) ->
    uniqueId = "Don't call this twice without a uniqueId"  unless uniqueId
    clearTimeout timers[uniqueId] if timers[uniqueId]
    timers[uniqueId] = setTimeout(callback, ms)
    return
)()

if window.chrome
  $('body').addClass 'chrome'

$(document).ready ->
  # lazyload images in .content & has width
  # $(".content img[width]").each ->
  #   $(this).attr 'data-original', $(this).attr 'src'
  #   $(this).attr 'src', ''

  # lazyload all images
  $("img").lazyload effect: "fadeIn"

  $("code").each ->
    $(this).html $(this).html().replace(/\n/g, "<br />")

refreshViev = () ->
  # 螢幕太大不要露內褲
  cmh = $(window).height() - $('header').height() - $('footer').height()
  nvh = $('.main-menu').height() + 18
  cmh = nvh if cmh < nvh
  $('.content').css 'min-height', cmh

  # set baseline for vertical rhythm
  vrLineHeight = $('.vertical-rhythm > p').css 'line-height'
  vrLineHeight = parseInt(vrLineHeight, 10);
  # $('.vertical-rhythm img').baseline vrLineHeight
  $('.vertical-rhythm div').baseline vrLineHeight
  $('.vertical-rhythm p').baseline vrLineHeight
  # 為包附圖片的元素加上 class
  $('.content p:has(img), .content div:has(img)').addClass 'img'

refreshViev()

# on load !
$(window).load ->
  refreshViev()

$(window).resize ->
  waitForFinalEvent (->
    refreshViev()
  ), 500, "winRz"
