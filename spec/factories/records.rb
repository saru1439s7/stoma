FactoryBot.define do
 #医療staffがかくストマ記録
  factory :record do
    adjacent { "acceptable" }
    barrier { "acceptable" }
    circumscribing { "acceptable" }
    discolor { "acceptable" }

    # sequence(:barrier) { |n| "barrier#{n}" }
    # sequence(:circumscribing) { |n| "circumscribing#{n}" }
    # sequence(:discolor) { |n| "discolor#{n}" }
    association :patient


    #enumの設定
    # https://qiita.com/mightysosuke/items/8fc12d43ae5e183a8c74
    Record.adjacents.keys.each do |adjacent|
      trait :"#{adjacent}" do
        status { adjacent }
      end
    end
    Record.barriers.keys.each do |barrier|
      trait :"#{barrier}" do
        status { barrier }
      end
    end
    Record.circumscribings.keys.each do |circumscribing|
      trait :"#{circumscribing}" do
        status { circumscribing }
      end
    end
     Record.discolors.keys.each do |discolor|
      trait :"#{discolor}" do
        status { discolor }
      end
    end
  end
end
