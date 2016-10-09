class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :solution
  scope :up, -> { where(direction: 'up') }
  scope :down, -> { where(direction: 'down') }

  # method to make sure person can't vote more than once
end
