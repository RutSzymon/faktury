@autocomplete_for = (field_name, source, method) ->
  $(field_name).autocomplete(
    dataType: "json"
    source: source
    focus: (event, ui) ->
      $(field_name).val ui.item[method]
      false
    select: (event, ui) ->
      $(field_name).val ui.item[method]
      $(field_name+"-id").val ui.item.id
      false
    response: (event, ui) ->
      if ui.content.length is 0
        $(field_name + "-hint").text "Brak wyników"
      else
        $(field_name + "-hint").empty()
  ).data("ui-autocomplete")._renderItem = (ul, item) ->
      $("<li></li>")
        .data("ui-autocomplete-item", item)
        .append("<a>" + item[method] + "</a>")
        .appendTo ul

@autocomplete_for_products = (field_name, hiden_field_name, url, type = "fields") ->
  $(field_name).autocomplete(
    source: (request, response) ->
      $.ajax
        url: url + "/other_products"
        dataType: "json"
        data:
          term: request.term
          product_ids: if type == "table" then $("#product-ids").attr("value") else $.map $(".well:visible [id^=product][id$=-id]"), (o) ->
            o.value

        success: (data) ->
          response data
    focus: (event, ui) ->
      $(field_name).val ui.item.name
      false
    select: (event, ui) ->
      $(field_name).val ui.item.name
      $(hiden_field_name).val ui.item.id
      false
    response: (event, ui) ->
      if ui.content.length is 0
        $(field_name + "-hint").text "Brak wyników"
      else
        $(field_name + "-hint").empty()
  ).data("ui-autocomplete")._renderItem = (ul, item) ->
      $("<li></li>")
        .data("ui-autocomplete-item", item)
        .append("<a>" + item.name + "</a>")
        .appendTo ul

  if type == "table"
    $("#products-button").click (e) ->
      $("#product_list").html "<div class=\"load\"><img src=\"/assets/load.gif\" width=\"150\" height=\"80\" alt=\"\" /></div>"
      $("#product-ids").val (if $("#product-ids").attr("value") == "" then $("#product-id").attr("value") else $("#product-ids").attr("value") + "," + $("#product-id").attr("value"))
      product_ids = $("#product-ids").attr("value").split(",")
      $.ajax
          url: (url + "/get_product_list")
          type: "GET"
          data:
            product_ids: product_ids
      e.preventDefault()

    $("#product_list").on "click", ".products-remove", (e) ->
      $("#product_list").html "<div class=\"load\"><img src=\"/assets/load.gif\" width=\"150\" height=\"80\" alt=\"\" /></div>"
      product_id = @.getAttribute("data-product-id")
      $("#product-ids").val ($("#product-ids").attr("value").split(",").filter((el) -> el isnt product_id).join(","))
      product_ids = $("#product-ids").attr("value").split(",")
      $.ajax
          url: (url + "/get_product_list")
          type: "GET"
          data:
            product_ids: product_ids
      e.preventDefault()

@url_for = (model_name) ->
  url = document.URL.replace("#", "")
  url_array = url.split("/")
  url = if url_array[url_array.length - 1] == model_name then url + "/new"
  else url.replace("/edit", "")