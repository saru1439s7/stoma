FactoryBot.define do
 #医療staffがかくストマ記録
    factory :comment do
      sequence(:comment) { |n| "comment#{n}" }
      
  　　association {:ostomy}
  　　association {:staff}
    end
end
