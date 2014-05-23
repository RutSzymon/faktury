ready = ->
  $("#price").each (index) ->
    $(this).val parseFloat($(this).val()).toFixed(2)

  $("#price").on "change", ->
    $(this).val parseFloat($(this).val()).toFixed(2)

$(document).ready(ready)
$(document).on('page:load', ready)