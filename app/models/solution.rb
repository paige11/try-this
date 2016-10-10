class Solution < ApplicationRecord
  belongs_to :contributor, class_name: 'User'
  belongs_to :question
  has_many :votes
  validates_presence_of :content

  def formatted_date_time
    created_at.strftime("%m-%d-%Y, %R")
  end

  def self.most_upvotes
    # to do
  end

end
