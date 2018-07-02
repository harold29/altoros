require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "is valid with first name and last name" do
    should validate_presence_of(:first_name)
    should validate_presence_of(:last_name)
  end

  it "is belongs to user" do
    should belong_to(:user)
  end
end
