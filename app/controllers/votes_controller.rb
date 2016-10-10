class VotesController < ApplicationController

  def create
    vote = Vote.find_or_create_by(user_id: vote_params[:user_id], solution_id: vote_params[:solution_id])
    vote.direction = vote_params[:direction]
    vote.save
    redirect_to question_path(vote.solution.question)
  end

  def vote_params
    params.require(:vote).permit(:direction, :user_id, :solution_id)
  end

end
