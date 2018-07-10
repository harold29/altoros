class Tenant < ApplicationRecord
  before_create :generate_api_key

  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :api_key, presence: true
  validates :successful_requests, numericality: { greater_than_or_equal_to: 0 }
  validates :failed_requests, numericality: { greater_than_or_equal_to: 0 }

  attr_accessor :requests

  def full_name
    self.first_name + " " + self.last_name
  end

  def requests
    self.successful_requests + self.failed_requests
  end

  def add_success_req
    self.successful_requests += 1
    self.save
  end

  def add_fail_req
    self.failed_requests += 1
    self.save
  end

  private

  def generate_api_key
    self.api_key = SecureRandom.hex
  end
end
