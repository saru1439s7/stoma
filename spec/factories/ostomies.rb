FactoryBot.define do
  #患者さんのストーマの記録
  factory :ostomy do
     color { "pink" }
     edema { "normal" }
     skin { "same" }
     association :patient
    # https://qiita.com/mightysosuke/items/8fc12d43ae5e183a8c74
    Ostomy.colors.keys.each do |color|
      trait :"#{color}" do
        status { color }
      end
    end
    Ostomy.skins.keys.each do |skin|
      trait :"#{skin}" do
        status { skin }
      end
    end
    Ostomy.edemas.keys.each do |edema|
      trait :"#{edema}" do
        status { edema }
      end
    end
  end
end
