class MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)

    if @message.valid?
      MessageMailer.contact(@message).deliver_now
      redirect_to new_message_path, notice: "Message received"
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :company, :email, :project_description, :budget)
  end
end
