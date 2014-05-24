#= require "autocomplete"

ready = ->
  url = url_for("invoices")

  if $("#contractor").length > 0
    autocomplete_for("#contractor", url + "/other_contractors", "name")

  $(".datepicker").datetimepicker
    language: "pl"
    pickTime: false

  $("form").on "click", ".remove_fields", (event) ->
    e = $(this).closest('.well').parent().find('._destroy')
    if e.val() is "false"
      e.val(true)

    $(this).closest('.well').hide()
    event.preventDefault()

  $("form").on "click", ".add_fields", (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data("id"), "g")

    $(this).before($(this).data("fields").replace(regexp, time))

    input_product = $("#orders").find(".products_input").last()
    input_product.attr("id", "product_#{time}")

    hidden_product = $("#orders").find("input[id^='product_'][id$='-id']:hidden").last()
    hidden_product.attr("id", "product_#{time}-id")

    pid = "#" + input_product.attr("id") + "-id"
    id = "#" + input_product.attr("id")

    autocomplete_for_products(id, pid, url)
    event.preventDefault()

$(document).ready(ready)
$(document).on('page:load', ready)