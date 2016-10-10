class VotesController < ApplicationController

  def create
    vote = Vote.find_or_create_by(user_id: vote_params[:user_id], solution_id: vote_params[:solution_id])
    if vote.direction == vote_params[:direction]
      vote.direction = nil
    else
      vote.direction = vote_params[:direction]
    end
    vote.save
    redirect_to question_path(vote.solution.question)
  end

  private

  def vote_params
    params.require(:vote).permit(:direction, :user_id, :solution_id)
  end

end
