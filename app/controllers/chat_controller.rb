class ChatController < WebsocketRails::BaseController
  def initialize_session
    binding.pry
    # perform application setup here
    controller_store[:message_count] = 0
  end

  def create_message
    binding.pry
  end
end