FactoryBot.define do
  factory :tenant do
    first_name "Jane"
    last_name "Doe"
    failed_requests 1
    successful_requests 1
    api_key "r4nD0m5tr1N6t0T357tH3kEY"

    factory :random_tenant do
      first_name { Faker::Name.first_name }
      last_name { Faker::Name.last_name }
      failed_requests { Faker::Number.number }
      successful_requests { Faker::Number.number }
      api_key { Faker::String.random }
    end

    factory :first_nameless_tenant do
      first_name nil
    end

    factory :last_nameless_tenant do
      last_name nil
    end

    factory :n_successful_tenant do
      successful_requests { -1 }
    end

    factory :n_failed_tenant do
      failed_requests { -1 }
    end

    factory :nil_successful_tenant do
      successful_requests nil
    end

    factory :nil_failed_tenant do
      failed_requests { -1 }
    end

    factory :nil_key_tenant do
      api_key nil
    end
  end
end
