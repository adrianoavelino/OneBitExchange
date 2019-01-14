$(document).ready ->
  $('#amount').bind 'input', ->
    $.ajax '/convert',
        type: 'GET'
        dataType: 'json'
        data: {
                source_currency: $("#source_currency").val(),
                target_currency: $("#target_currency").val(),
                amount: $("#amount").val()
              }
        error: (jqXHR, textStatus, errorThrown) ->
          alert textStatus
        success: (data, text, jqXHR) ->
          $('#result').val(data.value)
      return false;

  $('[data-js=reverseCurrency]').click ->
    tempSource = source_currency.value
    tempTarget = target_currency.value
    source_currency.value = tempTarget
    target_currency.value = tempSource
    $("#amount").val('')
    $("#result").val('')
    return false

  $('.credits a').click (e) ->
    e.preventDefault()
    $('.credits-links').toggle()
