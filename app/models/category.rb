class Category < ApplicationRecord
  has_many :category_questions
  has_many :questions, through: :category_questions
  scope :alphabetize, -> { order(:name) }


end
