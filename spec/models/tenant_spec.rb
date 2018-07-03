require 'rails_helper'

RSpec.describe Tenant, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  context "when is valid" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_numericality_of(:successful_requests). is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:failed_requests). is_greater_than_or_equal_to(0) }
  end

  context "when is invalid" do
    it "is not valid without first_name" do
      tenant = build(:tenant, first_name: nil)
      expect(tenant).to_not be_valid
    end

    it "is not valid without last_name" do
      tenant = build(:tenant, last_name: nil)
      expect(tenant).to_not be_valid
    end

    it "is not valid if negative successful requests" do
      tenant = build(:tenant, successful_requests: -1)
      expect(tenant).to_not be_valid
    end

    it "is not valid if negative failed requests" do
      tenant = build(:tenant, failed_requests: -1)
      expect(tenant).to_not be_valid
    end
  end

  context "when issue full name" do
    it "returns full name string" do
      tenant = build(:tenant)
      expect(tenant.full_name).to eq(tenant.first_name + " " + tenant.last_name)
    end
  end

  context "when issue requests" do
    it "returns total requests" do
      tenant = build(:tenant)
      expect(tenant.requests).to eq(tenant.successful_requests + tenant.failed_requests)
    end
  end
end
