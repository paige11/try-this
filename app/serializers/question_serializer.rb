class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :content, :created_at
  has_many :solutions
  has_one :user
end
