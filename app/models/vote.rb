class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :solution

  # method to make sure person can't vote more than once
end
