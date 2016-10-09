class Category < ApplicationRecord
  has_many :questions
  scope :alphabetize, -> { order(:name) }
  scope :return_categories_for_form, -> { where("id in ?", category_ids) }

end
