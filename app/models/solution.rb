class Solution < ApplicationRecord
  belongs_to :contributor, class_name: 'User'
  belongs_to :question
  has_many :votes
  
end
