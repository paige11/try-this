class Question < ApplicationRecord
  has_many :solutions, dependent: :destroy
  
  belongs_to :user
  has_many :contributors, through: :solutions, class_name: "User"
  has_many :category_questions
  has_many :categories, through: :category_questions
  validates_presence_of :content
  validates_uniqueness_of :content
  scope :most_recent, -> { order(created_at: :desc) }
  scope :ten_most_recent, -> { most_recent.limit(10) }

  def formatted_date_time
    created_at.strftime("%m-%d-%Y, %R")
  end

  def category_ids=(category_ids)
    categories.clear
    category_ids.each do |category_id|
      if !category_id.empty?
        category = Category.find(category_id)
        categories << category if !categories.include?(category)
      end
    end
  end

  def category_attributes=(category)
    if !category[:name].empty?
      category = Category.find_or_create_by(name: category[:name])
      categories << category
      save
    end
  end

end
