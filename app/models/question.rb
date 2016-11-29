class Question < ApplicationRecord
  has_many :solutions, dependent: :destroy
  belongs_to :user
  has_many :contributors, through: :solutions, class_name: "User"
  has_many :category_questions
  has_many :categories, through: :category_questions
  validates_presence_of :content
  validates_uniqueness_of :content
  validates_presence_of :category_ids
  scope :most_recent, -> { order(created_at: :desc) }
  scope :ten_most_recent, -> { last(10).reverse }
  scope :order_by_votes, -> { order(total_votes: :desc).limit(10) }
  include ApplicationHelper

  def categories_attributes=(attr)
    attr.values.each do |cat_info|
      category = Category.find_or_initialize_by(cat_info)
      self.categories << category unless category.name == ""
    end
  end

end
