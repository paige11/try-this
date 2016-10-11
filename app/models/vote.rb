class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :solution
  scope :up_count, -> { where(direction: 'up').count }
  scope :down_count, -> { where(direction: 'down').count }

  def determine_vote_direction(user_choice)
    if self.direction == user_choice
      self.direction = nil
    else
      self.direction = user_choice
    end
  end
end
