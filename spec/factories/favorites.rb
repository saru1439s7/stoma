FactoryBot.define do
 #医療staffがいいね
  factory :favorite do
　　association {:staff}
　　association {:ostomy}
  end
end
