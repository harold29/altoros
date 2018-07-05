class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :content

  belongs_to :user, key: :owner
  has_many :answers, serializer: AnswerSerializer
end
