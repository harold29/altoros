class Tenant < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :api_key, presence: true
  validates :successful_requests, numericality: { greater_than_or_equal_to: 0 }
  validates :failed_requests, numericality: { greater_than_or_equal_to: 0 }
end
