$(document).ready ->
  # cache the window object
  $window = $(window)
  $('section[data-type="background"]').each ->
    $scroll = $(this)
    $window.scroll ->
      yPos = -($window.scrollTop() / $scroll.data('speed'))
      coords = '50% ' + yPos + 'px'
      $scroll.css backgroundPosition: coords

  $ ->
    $('.tooltip').tooltip()

  $window.load ->
    $('.alert').delay(2000).fadeOut('slow')
