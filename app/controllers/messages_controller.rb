class MessagesController < ApplicationController
  before_action :require_user
  def create
    @message = Message.new(message_params)
 
    @message.user = current_user
    if @message.save
      redirect_to root_path
    else 
      render 'new'
    end

  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
