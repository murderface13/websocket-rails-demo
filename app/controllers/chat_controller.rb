class ChatController < WebsocketRails::BaseController
  def initialize_session
    binding.pry
    # perform application setup here
    controller_store[:message_count] = 0
  end

  def create
    new_comment = 'lorem ipsum'
    broadcast_message :new_comment, new_comment
    binding.pry
  end
end