FactoryBot.define do
  factory :user do
    name {"Michael Example"}
    sequence(:email) { |n| "test#{n}@example.com" } 
    password {"password"}
    password_confirmation  {"password"}
    admin {true}

    trait :noadmin do
      admin {false}
    end

    trait :users do
      sequence(:name) { |n| "User#{n}" } 
      sequence(:email) { |n| "testusers#{n}@example.com" }
      admin {false}
    end

  end
end
