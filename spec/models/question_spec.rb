require 'rails_helper'

RSpec.describe Question, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  context "when is valid" do
    it { should validate_presence_of(:content) }
  end

  context "belong to user" do
    it { should belong_to(:user) }
  end

  context "without content" do
    it "is not valid" do
      question = build(:question, content: nil)
      expect(question).to_not be_valid
    end
  end

end
