class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :questions
  has_many :answers, as: :answerable

  def full_name
    self.first_name + " " + self.last_name
  end
end
