class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :solution
  scope :up_count, -> { where(direction: 'up').count }
  scope :down_count, -> { where(direction: 'down').count }
  after_create :add_to_total_votes
  validates_presence_of :solution_id, :user_id, :direction

  def determine_vote_direction(user_choice)
    if self.direction == user_choice
      self.direction = nil
    else
      self.direction = user_choice
    end
  end

private

  def add_to_total_votes
    q = self.solution.question
    q.total_votes += 1
    q.save
  end
end
