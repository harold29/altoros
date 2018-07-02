require 'rails_helper'

RSpec.describe Answer, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "is valid with content" do
    should validate_presence_of(:content)
  end
  
  it "belongs to user" do
    should belong_to(:user)
  end
  
  it "belongs to question" do
    should belong_to(:answer)
  end
end
