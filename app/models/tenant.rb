class Tenant < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :api_key, presence: true
  validates :successful_requests, numericality: { greater_than_or_equal_to: 0 }
  validates :failed_requests, numericality: { greater_than_or_equal_to: 0 }

  def full_name
    self.first_name + " " + self.last_name
  end

  def requests
    self.successful_requests + self.failed_requests
  end

  def add_s_request
    self.successful_requests += 1
  end

  def add_f_request
    self.failed_requests += 1
  end
end
