class MessagesController < ApplicationController
  def create
    params = JSON.parse(request.raw_post)
    message = Message.create(username: params['user_id'], message: params['message'])
    # we will return 500 if we can't create message
    stasus = 500
    if message.errors.blank?
      response_json = {
        message: params['message'], user_id: params['user_id']
      }.to_json
      WebsocketRails[:messages].trigger('message_sent', response_json)
      status = 204
    end
    render nothing: true, status: status
  end
end
