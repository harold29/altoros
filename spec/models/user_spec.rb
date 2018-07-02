require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  context "when is valid" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end
end
