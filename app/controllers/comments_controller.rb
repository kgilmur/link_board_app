class CommentsController < ApplicationController

 before_action :is_authenticated?

  def index
    # @comments = Comment.all
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    # @users = User.find_by_id(@post.user_id])
    @vote = Vote.new

  end

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    Comment.create({:body => params[:comment][:body], :post_id => params[:post_id], :user_id => current_user.id})
    redirect_to post_comments_path

 end

  private

  def post_params
    params.require(:post).permit(:title,:link)
  end


end



