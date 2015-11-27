ready = ->
  dispatcher = new WebSocketRails('localhost:3000/websocket')
  channel = dispatcher.subscribe('send_message');
  channel.bind 'create_message', (data) ->
    alert(data)


$(document).ready(ready)
$(document).on('page:load', ready)