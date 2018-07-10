FactoryBot.define do
  factory :question do
    content "Potato or poteito?"
    private_question false
    user

    trait :private do
      private_question true
    end

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
        create_list :answer, evaluator.answers_count, question: question
      end
    end

    factory :random_questions_with_answers do
      content Faker::Lorem.question

      transient do
        answers_count 5
      end

      after :create do |question, evaluator|
        create_list :answer, evaluator.answers_count, question: question
      end
    end
  end
end
