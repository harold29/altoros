require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  context "when is valid" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

  context "associations" do
    it { should have_many(:questions) }
    it { should have_many(:answers) }
  end

  context "when issue full name" do
    it "returns full name string" do
      user = build(:user)
      expect(user.full_name).to eq(user.first_name + " " + user.last_name)
    end
  end

  context "without first_name or last_name" do
    it "is not valid without first_name" do
      user = build(:user, first_name: nil)
      expect(user).to_not be_valid
    end

    it "is not valid without last_name" do
      user = build(:user, last_name: nil)
      expect(user).to_not be_valid
    end
  end
end
