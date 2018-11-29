class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :toggle_status]
  access all: [:show, :index, :new, :create], user: {except: [:destroy, :update, :edit, :toggle_status]}, admin: :all

  def index
    if logged_in?(:admin)
      @blogs = Blog.page(params[:page]).per(10)
    else
      @blogs = Blog.page(params[:page]).per(10)
    end
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
      if @blog.save
        redirect_to blog_path(@blog)
      else
        render :new
      end
  end

  def edit
  end
  
  def update
      if @blog.update(blog_params)
        @blog.save
        redirect_to @blog, notice: 'Your blog was edited successfully'
      else
        render :edit
      end
  end

  def show
    @blog = Blog.friendly.find(params[:id])
  end
  
  def destroy
    if @blog.destroy
          redirect_to blogs_path, notice: 'Your blog was destroyed successfully'
      else
        render :show, notice: 'Your blog could not be destroyed'
      end
  end



  def toggle_status
    if @blog.draft?
      @blog.published!
    elsif @blog.published?
      @blog.draft!
    end      
    redirect_to blog_path, notice:  "#{@blog.title} status has been updated."
  end


  private

    def set_blog
      @blog = Blog.find(params[:id])
    end

    def blog_params
          params.require(:blog).permit(:title, :body, :name)
    end

end
