class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, as: :answerable

  validates :content, presence: true
end
