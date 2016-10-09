class Question < ApplicationRecord
  has_many :solutions
  belongs_to :user
  has_many :contributors, through: :solutions, class_name: "User"
  belongs_to :category

  def self.ten_most_recent
    order(created_at: :desc).first(10)
  end
end
