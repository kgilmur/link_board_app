
class PostsController < ApplicationController
 before_action :is_authenticated?
  def index
   @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    # @post = current_user.Post.create(post_params)
    # if @post.errors.any?
    #   flash[:danger] = "Not logged in"
    # else
    #   flash[:success] = "Added"
    #   redirect_to showposts_path
    # end
     @post = current_user.posts.create(post_params)
    if @post.save
      flash[:success] = "Post successful."
      redirect_to :posts
    else
      flash[:danger] = "Post unsuccessful, please make sure you have a valid link."
      redirect_to :posts
       # render :new
    end

    # @post = Post.create(post_params)

    # render :json => params


  end

  private

  def post_params
    params.require(:post).permit(:title, :link)
  end

end