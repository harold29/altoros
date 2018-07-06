require 'rails_helper'

RSpec.describe "Questions", type: :request do
  describe "GET /questions" do
    it "works! (now write some real specs)" do
      get questions_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /question" do
    it "get a public question" do
      user = create(:user_with_questions)
      get question_path(user.questions[0].id)
      expect(response).to have_http_status(200)

      json = JSON.parse(response.body)

      expect(json["data"]["relationships"]["owner"]["data"]["id"]).to eq user.id.to_s
      expect(json["data"]["id"]).to eq user.questions[0].id.to_s
      # expect(json["question"]["answers"][0])
    end

    it "returns a 403 status for a private question" do
      user = create(:user_with_private_question)
      get question_path(user.questions[0].id)

      expect(response).to have_http_status(403)
    end
  end
end
