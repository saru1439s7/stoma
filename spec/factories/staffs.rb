FactoryBot.define do
  factory :staff do
    sequence(:name) { |n| "TEST_NAME#{n}"}
    sequence(:email) { |n| "TEST#{n}@example.com"}
  
  end
end