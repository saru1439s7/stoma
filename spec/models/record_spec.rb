require 'rails_helper'

RSpec.describe Record, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
   before do  #モデルのみの作成

    @patient = build(:patient)
    @records = build(:records,patient: @patient)
   end

    describe 'バリテーション' do

       it 'adjacentが空はNG' do
          expect(page).to have_checked_field('adjacent', visible:false)
       end

       it 'barrierが空はNG' do
          expect(page).to have_checked_field('barrier', visible:false)
       end

       it 'circumscribingが空はNG' do
           expect(page).to have_checked_field('circumscribing', visible:false)
       end
       
       it 'discolorが空はNG' do
           expect(page).to have_checked_field('discolor', visible:false)
       end
    end


    describe 'アソシエーションのテスト' do
      context 'Patientモデルとの関係' do
        it 'belongs_toとなっている' do
          expect(Record.reflect_on_association(:patient).macro).to eq :belongs_to
        end
      end
    end
end
