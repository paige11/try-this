class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :solution
  scope :up_count, -> { where(direction: 'up').count }
  scope :down_count, -> { where(direction: 'down').count }

end
