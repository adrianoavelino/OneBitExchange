$(document).ready ->

  getMockConvertionValue = ->
    console.log 'executou'
    amount = $("#amount").val()
    $('#result').val('999' + amount)
    return false

  getConvertionValue = ->
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

  $('form').submit (e) ->
    e.preventDefault()
    if $('form').attr('action') == '/convert' && $("#amount").val().length >= 1
      # getMockConvertionValue()
      getConvertionValue()

  triggerConvertion = null
  $('#amount').bind 'input', ->
    $("#result").val('Convertendo ...')
    clearInterval triggerConvertion
    triggerConvertion = setInterval((->
      clearInterval triggerConvertion
      # getMockConvertionValue()
      getConvertionValue()
      return
    ), 1500)
    return

  $('[data-js=reverseCurrency]').click ->
    tempSource = source_currency.value
    tempTarget = target_currency.value
    source_currency.value = tempTarget
    target_currency.value = tempSource
    $("#result").val('Convertendo ...')
    # getMockConvertionValue()
    getConvertionValue()
    return false

  $('.credits a').click (e) ->
    e.preventDefault()
    $('.credits-links').toggle()
