require 'rails_helper'

RSpec.describe "Questions", type: :request do
  describe "GET /questions" do
    it "works!" do
      tenant = create(:tenant)
      get questions_path(api_key: tenant.api_key)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /question" do
    it "get a public question" do
      user = create(:user_with_questions)
      tenant = create(:tenant)
      puts "POTATO" + question_path(id: user.questions[0].id, api_key: tenant.api_key)
      get question_path(id: user.questions[0].id, api_key: tenant.api_key)
      expect(response).to have_http_status(200)

      json = JSON.parse(response.body)

      expect(json["data"]["relationships"]["owner"]["data"]["id"]).to eq user.id.to_s
      expect(json["data"]["id"]).to eq user.questions[0].id.to_s
      # expect(json["question"]["answers"][0])
    end

    it "returns a 403 status for a private question" do
      user = create(:user_with_private_question)
      tenant = create(:tenant)
      get question_path(id: user.questions[0].id, api_key: tenant.api_key)

      expect(response).to have_http_status(403)
    end
  end
end
