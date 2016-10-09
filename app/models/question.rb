class Question < ApplicationRecord
  has_many :solutions
  belongs_to :user
  has_many :contributors, through: :solutions, class_name: "User"
  belongs_to :category

  def self.ten_most_recent
    all.order(:created_at).first(10)
  end
end
