FactoryBot.define do
  factory :patient do
    sequence(:name) { |n| "TEST_NAME#{n}"}
    sequence(:name_kana) { |n| "TEST_NAME_KANA#{n}"}
    sequence(:email) { |n| "TEST#{n}@example.com"}
    sequence(:password) { |n| "TESTTEST#{n}"}

    trait :invalid do
      name nil
      name_kana nil
      email nil
      password nil
    end

    # name { Faker::Name.last_name }
    # name_kana { Faker::Name.kana_name }
    # email { Faker::Internet.free_email }
    # password = Faker::Internet.password(min_length: 6)
    # password { password }
    # password_confirmation { password }
  factory :takashi, class: Patient do
    name { "Takashi" }
    name_kana {"たかし"}
    email {"takashi@example.com"}
    password {"takashi"}
  end

  factory :satoshi, class: Patient do
    name { "Satoshi" }
    name_kana {"さとし"}
    email {"satoshi@example.com"}
    password {"satoshi"}
  end
 end
end