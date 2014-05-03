fadeHero = (s=-1) ->
  heroItems = $('.hero > .item')
  scrollTop = (if s > 0 then s else $(document).scrollTop())
  opacity = (600 - scrollTop) / 600
  if opacity < 1
    opacity = 0.28 if opacity < 0.28
    heroItems.css 'opacity', opacity
    heroItems.css '-webkit-filter', 'grayscale(' + (100 - opacity*100)/(100-28)*36 + '%)'
    heroItems.css '-moz-filter', 'grayscale(' + (100 - opacity*100)/(100-28)*36 + '%)'
    heroItems.css 'filter', 'grayscale(' + (100 - opacity*100)/(100-28)*36 + '%)'
  else
    heroItems.css 'opacity', '1'
    heroItems.css '-webkit-filter', 'grayscale(0%)'
    heroItems.css '-moz-filter', 'grayscale(0%)'
    heroItems.css 'filter', 'grayscale(0%)'

forecastFade = (t=0) ->
  if t == 0
    this.forecastFadeOne = $(document).scrollTop()
    setTimeout ->
      forecastFade(1)
    , 50
  else
    console.log $(document).scrollTop() - forecastFadeOne
    fadeHero(($(document).scrollTop() - forecastFadeOne)*7)

# 捲動特效
this.prevScr = 0
$(window).bind "scroll", ->
  nowScr = $(document).scrollTop()
  # 若抵達頁面頂端，馬上將 hero 圖完全顯示
  if (prevScr != nowScr) && (nowScr == 0)
    fadeHero()
  # 若由頁面頂端離開，推測捲動速度並馬上 fade
  else if (prevScr != nowScr) && (prevScr == 0)
    forecastFade()
    # calcFade = 1-nowScr/10
    # calcFade = 0.28 if calcFade < 0.28
    # fadeHero(calcFade)
  this.prevScr = $(document).scrollTop()
  waitForFinalEvent (->
    fadeHero()
  ), 500, "winScr"

setTimeout ->
  fadeHero()
, 500

setTimeout ->
  fadeHero()
, 1000

setTimeout ->
  fadeHero()
, 2000
