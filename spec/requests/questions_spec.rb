require 'rails_helper'

RSpec.describe "Questions", type: :request do
  describe "GET /questions" do
    it "works! (now write some real specs)" do
      get questions_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /question" do
    it "get a question" do
      user = create(:user_with_questions)
      get questions_path, params: { question_id: user.questions[0].id }
      expect(response).to have_http_status(200)

      json = JSON.parse(response.body)
      expect(json.length).to eq 1

      expect(json["question"]["user_id"]).to eq user.id.to_s
      expect(json["question"]["id"]).to eq user.questions[0].id.to_s
      # expect(json["question"]["answers"][0])
    end
  end
end
