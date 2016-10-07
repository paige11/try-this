class Question < ApplicationRecord
  has_many :solutions
  belongs_to :user
  has_many :contributors, through: :solutions, class_name: "User"
  belongs_to :category
end
