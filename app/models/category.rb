class Category < ApplicationRecord
  has_many :category_questions
  has_many :questions, through: :category_questions
  scope :alphabetize, -> { order(:name) }
  validates_presence_of :name
  validates_uniqueness_of :name

end
