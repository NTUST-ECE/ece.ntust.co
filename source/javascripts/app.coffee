console.log 'hi'


$(document).ready ->
  $("code").each ->
    $(this).html $(this).html().replace(/\n/g, "<br />")

# on load !
$(window).load ->
  # set baseline for vertical rhythm
  vrLineHeight = $('.vertical-rhythm > p').css 'line-height'
  vrLineHeight = parseInt(vrLineHeight, 10);
  console.log vrLineHeight
  $('.vertical-rhythm img').baseline vrLineHeight
  # 偏執的內文修正
  $('.vertical-rhythm p').baseline vrLineHeight
