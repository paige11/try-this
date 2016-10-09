class Category < ApplicationRecord
  has_many :questions

  def self.alphabetize
    order(:name)
  end
end
