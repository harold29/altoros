require 'rails_helper'

RSpec.describe Answer, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  context "when is valid" do
    it { should validate_presence_of(:content) }
  end

  context "belong to user" do
    it { should belong_to(:user) }
  end
  
  context "belong to question" do
    it { should belong_to(:question) }
  end

  context "without content" do
    it "is not valid" do
      answer = build(:answer, content: nil)
      expect(answer).to_not be_valid
    end
  end
end
