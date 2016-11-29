class VoteSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :solution_id, :direction
  has_one :solution, :user
end
