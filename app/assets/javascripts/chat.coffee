ready = ->
  dispatchers = {}
  channels = {}

  $.each [1,2,3], (index, id) ->
    dispatchers[id] = new WebSocketRails('localhost:3000/websocket')
    channels[id] = dispatchers[id].subscribe('messages')

    channels[id].bind 'message_sent', (response) ->
      data = JSON.parse(response)
      if data.user_id != id
        $newMessage = $("<li></li>")
        $newMessage.html(data.message)
        $('.user_' + id + ' ul').append($newMessage)

    $('.user_' + id + ' a').click (e) ->
      $input = $('.user_' + id + ' input')
      message = $input.val()
      $input.val('')
      $.ajax
        url: '/messages'
        type: 'POST'
        data: JSON.stringify(message: message, user_id: id)
        dataType: 'json'
        success: ->
          $newLi = $("<li></li>")
          $newLi.html(message)
          $newLi.addClass('own')
          $('.user_' + id + ' ul').append($newLi)


$(document).ready(ready)
$(document).on('page:load', ready)