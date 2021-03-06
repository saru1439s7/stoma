FactoryBot.define do
 #患者がかく記録
  factory :dialy do
    association :patient
      #enumの設定
      # https://qiita.com/mightysosuke/items/8fc12d43ae5e183a8c74
      Dialy.colors.keys.each do |color|
        trait :"#{color}" do
          status { color }
        end
      end
      Dialy.feelings.keys.each do |feeling|
        trait :"#{feeling}" do
          status { feeling }
        end
      end

      # after(:build) do |dialy|
      #   dialy.attached = fixture_file_upload(Rails.root.join('spec/fixtures/images/no_image.jpeg', 'image/jpeg'))
      # end
  end
end
