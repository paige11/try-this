class Solution < ApplicationRecord
  belongs_to :contributor, class_name: 'User'
  belongs_to :question
  has_many :votes, dependent: :destroy
  validates_presence_of :content
  validates_uniqueness_of :content
  scope :most_recent, -> { order(created_at: :desc) }
  include ApplicationHelper
  
end
