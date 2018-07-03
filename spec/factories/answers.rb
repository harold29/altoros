FactoryBot.define do
  factory :answer do
    content "Definitely poteito"
    user
    question

    factory :random_answer do
      content Faker::Lorem.sentence
    end

    factory :empty_answer do
      content nil
    end

    factory :nonuser_answer do
      user nil
    end

    factory :nonquestion_answer do
      question nil
    end
  end
end
