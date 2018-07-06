class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name

  has_many :questions
  has_many :answers
end
