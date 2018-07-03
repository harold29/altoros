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

    factory :questions_with_answers do
      transient do
        answers_count 5
      end

      after :create do |question, evaluator|
        create_list :answers, evaluator.answers_count, :random_user, question: question
      end
    end
  end
end
