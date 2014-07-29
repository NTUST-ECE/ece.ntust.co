console.log 'hi'

# Responsive Breakpoints
desktopMinWidth = 941

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
  nvh = $('.main-menu').height() + 72
  cmh = nvh if cmh < nvh
  $('.main').css 'min-height', cmh
  # 如果 pull-right 撞上 Nav ...
  navBottomPosition = $('.main-menu').offset().top + $('.main-menu').height()
  $('.pull-left').each ->
    if $(this).offset().top < navBottomPosition + 100
      $(this).addClass('not-raised')
    else
      $(this).removeClass('not-raised')
  tid = 0
  # timeline
  $('.timeline-articles.auto-label').each ->
    tid++
    $(this).children('.navigator').remove()
    $(this).children('.label').remove()
    $(this).prepend '<div class="navigator"><ul></ul></div>'
    nav = $(this).children('.navigator').children('ul')
    dt = 0
    pdt = 0
    d = new Date()
    pd = new Date()
    n = 0
    $(this).children('.article').each ->
      n++
      pdt = dt
      dt = $(this).children('.date').attr('datetime') or $(this).children('a').children('.date').attr('datetime')
      d.setTime(Date.parse(dt))
      pd.setTime(Date.parse(pdt))
      if pdt != 0
        i = d.getFullYear()
        k = pd.getFullYear()
        j = d.getMonth() + 1
        l = 12
        while i <= k
          l = pd.getMonth() if i == k
          while j <= l
            # $(this).before i + " " + j + ' / ' + k + ' ' + l + '<br>'
            if j is 1 or j is 7
              $(this).before '<div id="timeline-' + tid + '-' + i + '-' + j + '" class="label">' + i + '/' + j + '</div>'
              nav.children('.link-to-' + n).remove()
              nav.append '<li class="link-to-' + n + '"><a href="#timeline-' + tid + '-' + i + '-' + j + '">' + i + '/' + j + '</a></li>'
            j++
          j = 1
          i++
  $('.timeline-articles .label').each ->
    if $(this).offset().top < navBottomPosition + 100
      $(this).addClass('not-raised')
    else
      $(this).removeClass('not-raised')
  if $(window).width() > desktopMinWidth - 30
    $(window).bind "scroll", ->
      if $(window).width() > desktopMinWidth - 30
        $('.timeline-articles.auto-label').each ->
          navigator = $(this).children('.navigator')
          pt = $(this).offset().top
          pd = $(this).offset().top + $(this).height()
          if $(document).scrollTop() > navBottomPosition + 520 and $(document).scrollTop() > pt and $(document).scrollTop() < pd
            navigator.addClass 'show'
            if navigator.children('ul').children('li.active')[0]
              activeLi = navigator.children('ul').children('li.active')
              activeIndex = activeLi.index()
              if $(document).scrollTop() > $(activeLi.children('a').attr('href')).offset()?.top - 120
                nextLi = navigator.children('ul').children('li:nth-of-type(' + (activeIndex + 2) + ')')
                if $(document).scrollTop() > $(nextLi.children('a').attr('href')).offset()?.top - 120
                  activeLi.removeClass('active')
                  nextLi.addClass('active')
              else
                prevLi = navigator.children('ul').children('li:nth-of-type(' + (activeIndex) + ')')
                console.log prevLi
                activeLi.removeClass('active')
                prevLi.addClass('active')
            else
              navigator.children('ul').children('li').each ->
                if $(document).scrollTop() > $($(this).children('a').attr('href')).offset()?.top - 120
                  navigator.children('ul').children('li').removeClass 'active'
                  $(this).addClass 'active'
          else
            navigator.removeClass 'show'

  # 重新調整基線旋律
  refreshBaseline()
  # 為包著圖片的元素加上 class
  $('.main p:has(img), .main div:has(img)').each ->
    $(this).addClass 'img' if $(this).children('img')[0]
  # CSS3 Fallbacks (Modernizr feature-detects include 在 modernizr.js)
  if not Modernizr.cssvwunit
    1
  # ...
  # 動態 css
  jsCssNode = document.getElementById('js-css')
  jsCssNode.parentNode.removeChild(jsCssNode) if jsCssNode?.parentNode
  css = "body.nav-open nav.main-menu { max-height: " + ($('.main-menu ul').height()+30) + "px !important; } "
  css += "body.nav-open nav.main-menu > h1 { transform: translateY(" + ($('.main-menu li.active').offset().top - ($('nav.main-menu > h1').height() - $('.main-menu li.active').height())/2) + "px); -o-transform: translateY(" + ($('.main-menu li.active').offset().top - ($('nav.main-menu > h1').height() - $('.main-menu li.active').height())/2) + "px); -ms-transform: translateY(" + ($('.main-menu li.active').offset().top - ($('nav.main-menu > h1').height() - $('.main-menu li.active').height())/2) + "px); -moz-transform: translateY(" + ($('.main-menu li.active').offset().top - ($('nav.main-menu > h1').height() - $('.main-menu li.active').height())/2) + "px); -webkit-transform: translateY(" + ($('.main-menu li.active').offset().top - ($('nav.main-menu > h1').height() - $('.main-menu li.active').height())/2) + "px); !important; } "
  head = document.head or document.getElementsByTagName("head")[0]
  style = document.createElement("style")
  style.type = "text/css"
  style.id = "js-css"
  if style.styleSheet
    style.styleSheet.cssText = css
  else
    style.appendChild document.createTextNode(css)
  head.appendChild style
  # smoothScrolling
  $("a[href*=#]:not([href=#])").click ->
    if location.pathname.replace(/^\//, "") is @pathname.replace(/^\//, "") and location.hostname is @hostname
      target = $(@hash)
      target = (if target.length then target else $("[name=" + @hash.slice(1) + "]"))
      if target.length
        $("html,body").animate
          scrollTop: target.offset().top - 18
        , 1000
        false

refreshViev()

# 按鈕動作
$('nav > h1').click ->
  return if $('nav > h1').hasClass('disabled')
  if $('body').hasClass('nav-open')
    $('body').removeClass('nav-open')
    $('nav > h1').addClass('disabled')
  else
    $('body').addClass('nav-open')
    $('nav > h1').addClass('disabled')
    $('body.nav-open .main').click ->
      $('body').removeClass('nav-open')
  setTimeout ->
    $('nav > h1').removeClass('disabled')
  , 1200

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
