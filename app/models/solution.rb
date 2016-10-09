class Solution < ApplicationRecord
  belongs_to :contributor, class_name: 'User'
  belongs_to :question
  has_many :votes

  # for numbers on up and down buttons
  def upvoted
    votes.up.count
  end

  def downvoted
    votes.down.count
  end
end
