ready = ->
  $(window).scroll ->
    element = $('#page-top-btn')
    visible = element.is(':visible')
    height = $(window).scrollTop()
    if height > 300
      element.fadeIn() if !visible
    else
      element.fadeOut()

$(document).ready(ready)
$(document).on('page:load', ready)