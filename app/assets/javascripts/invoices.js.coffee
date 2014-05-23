#= require "autocomplete"

ready = ->
  url = url_for("invoices")

  if $("#contractor").length > 0
    autocomplete_for("#contractor", url + "/other_contractors", "name")

  $(".datepicker").datetimepicker
    language: "pl"
    pickTime: false

$(document).ready(ready)
$(document).on('page:load', ready)