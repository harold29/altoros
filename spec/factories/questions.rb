FactoryBot.define do
  factory :question do
    content "Potato or poteito?"
    user

    factory :random_question do
      content Faker::Lorem.question
    end

    factory :empty_question do
      content nil
    end

    factory :nonuser_question do
      user nil
    end
  end
end
