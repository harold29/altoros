class Question < ApplicationRecord
  include PgSearch
  pg_search_scope :matching_terms,
                  :against => :content

  belongs_to :user
  has_many :answers

  validates :content, presence: true
end
