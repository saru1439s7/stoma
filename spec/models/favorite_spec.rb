require 'rails_helper'

RSpec.describe Favorite, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  
    before do  #モデルのみの作成
      @staff = build(:staff)
      @ostomy = build(:ostomy)
      @favorite = build(:favorite,staff: @staff,ostomy: @ostomy)
     end


    describe 'アソシエーションのテスト' do
      context 'Staffモデルとの関係' do
        it 'belongs_toとなっている' do
          expect(Favorite.reflect_on_association(:staff).macro).to eq :belongs_to
        end
      end

      context 'Ostomyモデルとの関係' do
        it 'belongs_toとなっている' do
          expect(Favorite.reflect_on_association(:ostomy).macro).to eq :belongs_to
        end
      end
    end
end
