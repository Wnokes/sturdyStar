class PortfoliosController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy, :toggle_status]
  access all: [:show, :index], user: {except: [:destroy, :new ,:create, :update, :edit, :sort]}, admin: :all

  def index
    if logged_in?(:admin)
      @portfolios = Portfolio.all
    else
      @portfolios = Portfolio.published
    end  end

  def sort
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
      redirect_to portfolios_path
    end

    render nothing: true
  end

  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
      if @portfolio.save
        redirect_to portfolio_path(@portfolio)
      else
        render :new
      end
  end

  def edit
  end
  
  def update
      if @portfolio.update(portfolio_params)
        @portfolio.save
        redirect_to @portfolio, notice: 'Your portfolio was edited successfully'
      else
        render :edit, notice: "Error updating your portfolio"
      end
  end

  def show
    @portfolio = Portfolio.friendly.find(params[:id])
    @gallery_items = GalleryItem.where(portfolio_id: @portfolio.id)
  end
  
  def destroy
    if @portfolio.destroy
          redirect_to portfolios_path, notice: 'Your portfolio was destroyed successfully'
      else
        render :show, notice: 'Your portfolio could not be destroyed'
      end
  end



  def toggle_status
    if @portfolio.draft?
      @portfolio.published!
    elsif @portfolio.published?
      @portfolio.draft!
    end      
    redirect_to portfolio_path, notice:  "#{@portfolio.title} status has been updated."
  end


  private

    def set_portfolio
      @portfolio = Portfolio.find(params[:id])
    end

    def portfolio_params
      params.require(:portfolio).permit(:title, 
                                        :subtitle, 
                                        :description, 
                                        :main_image, 
                                        :thumbnail_image, 
                                        :url, 
                                        gallery_items_attributes: 
                                          [ :id, 
                                            :title, 
                                            :image, 
                                            :description, 
                                            :_destroy],

                                        technologies_attributes: 
                                          [:id, 
                                            :title,
                                            :_destroy])
    end

end
