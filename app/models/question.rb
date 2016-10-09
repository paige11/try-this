class Question < ApplicationRecord
  has_many :solutions
  belongs_to :user
  has_many :contributors, through: :solutions, class_name: "User"
  has_many :categories
  validates_presence_of :content
  scope :most_recent, -> { order(created_at: :desc) }
  scope :ten_most_recent, -> { most_recent.limit(10) }

  def formatted_date
    created_at.strftime("%b %e, %Y - %I:%M %p")
  end

  def category_ids=(category_ids)
    if category_ids.empty?
      categories = []
    else
      categories = Category.return_categories_for_form
    end
    self.categories = categories
    self.save
  end

end
