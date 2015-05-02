class VotesController < ApplicationController

 before_action :is_authenticated?

 def create
  if params.key?(:comment_id)
    thing = Comment.find_by_id(params[:comment_id])
  elsif params.key?(:user_id)
    thing = User.find_by_id(params[:user_id])
  elsif params.key?(:post_id)
    thing = Post.find_by_id(params[:post_id])
  else
    return render plain: "invalid input!"
  end

  my_vote = thing.votes.find_by_user_id(current_user.id)
#if there is no vote from the user yet
  if my_vote.nil?
  # create a vote
    current_user.ratings << thing.votes.create(vote_params)
  else
    if(params[:vote][:value].to_i != my_vote.value)
      my_vote.value=params[:vote][:value]
      my_vote.save
    else
      flash[:danger] = "You have already voted on that!"
    end
  end
  redirect_to (:back)
  # render json: thing
  end


  private

  def vote_params
    params.require(:vote).permit(:value)
  end

end
