class SolutionSerializer < ActiveModel::Serializer
  attributes :id, :question_id, :content, :votes, :contributor
end
