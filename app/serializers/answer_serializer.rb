class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :content

  belongs_to :user
  belongs_to :question

  class UserSerializer < ActiveModel::Serializer
    attributes :id, :full_name
  end
end
