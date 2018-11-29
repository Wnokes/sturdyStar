class SupportController < ApplicationController

  def new
    @support = Support.new
  end

  def create
    @support = Support.new support_params

    if @support.valid?
      SupportMailer.contact(@support).deliver_now
      redirect_to new_support_url, notice: "Message received"
    else
      render :new
    end
  end

  private

  def support_params
    support_params = params.require(:support).permit(:name, :email, :body)
  end
end
