FactoryBot.define do
  factory :user do
    first_name "John"
    last_name "Doe"

    factory :random_user, class: User do
      first_name { Faker::Name.first_name }
      last_name { Faker::Name.last_name }
    end

    factory :first_nameless_user, class: User do
      first_name nil
    end

    factory :last_nameless_user, class: User do
      last_name nil
    end

    factory :user_with_questions do
      transient do
        questions_count 3
      end

      after :create do |user, evaluator|
        create_list :questions_with_answers, evaluator.questions_count, user: user
      end
    end

    factory :user_with_private_question do
      transient do
        questions_count 3
      end

      after :create do |user, evaluator|
        create_list :questions_with_answers, evaluator.questions_count, :private, user: user
      end
    end
  end
end
