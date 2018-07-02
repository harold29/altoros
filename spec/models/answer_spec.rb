require 'rails_helper'

RSpec.describe Answer, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "is valid with content" do
    should validate_presence_of(:content)
  end
end
