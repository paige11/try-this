class Question < ApplicationRecord
  has_many :solutions
  belongs_to :user
  has_many :contributors, through: :solutions, class_name: "User"
  belongs_to :category

  def self.ten_most_recent
    order(created_at: :desc).first(10)
  end

  def self.most_recent
    order(created_at: :desc)
  end

  def formatted_date
    created_at.strftime("%b %e, %Y - %I:%M %p")
  end

end
