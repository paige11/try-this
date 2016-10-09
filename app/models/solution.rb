class Solution < ApplicationRecord
  belongs_to :contributor, class_name: 'User'
  belongs_to :question
  has_many :votes
  validates_presence_of :content

  # for numbers on up and down buttons
  def upvotes
    votes.upvoted_number
  end

  def downvotes
    votes.downvoted_number
  end

end
