FactoryBot.define do
  factory :staff do
    sequence(:name) { |n| "TEST_NAME#{n}"}
    sequence(:email) { |n| "TEST#{n}@example.com"}
    sequence(:password) { |n| "TESTTEST#{n}"}
    # name {"staff1"}
    # email {"staff@staff"}
    # password {"staffstaff"}
  end

    trait :invalid do
      name nil
      email nil
      password nil
    end
end