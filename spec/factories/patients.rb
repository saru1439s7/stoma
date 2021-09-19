FactoryBot.define do
  factory :patient do
    sequence(:name) { |n| "TEST_NAME#{n}"}
    sequence(:name_kana) { |n| "TEST_NAME_KANA#{n}"}
    sequence(:email) { |n| "TEST#{n}@example.com"}
    sequence(:password) { |n| "TESTTEST#{n}"}
  end
end
#