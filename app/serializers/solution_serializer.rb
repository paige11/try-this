class SolutionSerializer < ActiveModel::Serializer
  attributes :id, :question_id, :content, :votes 
end
