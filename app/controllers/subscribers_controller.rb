class SubscribersController < ApplicationController
	before_action :set_subscriber, only: [:show, :update, :destroy]
  access all: [:new, :create,:destroy, :show], user: {except: [:index]}, admin: :all

  def index
    if logged_in?(:admin)
      @subscribers = Subscriber.page(params[:page]).per(10)
    end
  end

  def new
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)
      if @subscriber.save
        redirect_to subscriber_path(@subscriber)
      else
        render :new
      end
  end

  def show
    @subscriber = Subscriber.friendly.find(params[:id])
  end
  
  def destroy
    if @subscriber.destroy
          redirect_to :root, notice: 'You have unsubscribed successfully'
      else
        render :show, notice: 'Your subscriber could not be destroyed'
      end
  end

  private

    def set_subscriber
      @subscriber = Subscriber.find(params[:id])
    end

    def subscriber_params
          params.require(:subscriber).permit(:title, :body)
    end
end
