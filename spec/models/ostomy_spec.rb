require 'rails_helper'

RSpec.describe Ostomy, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

   before do  #モデルのみの作成
    @patient = build(:patient)
    @ostomy = build(:ostomy, patient: @patient)
   end

    describe 'バリテーション' do

       it 'color,edema,skinが設定されていれば、OK'do
        expect(@ostomy.valid?).to eq(true)
    #      expect(page).to have_checked_field('ラベル文字列')
       end

       it 'colorが空はNG' do
    #     @ostomy.color = ''
    #     expect(@ostomy.valid?).to eq(false)
          #expect(page).to have_checked_field('color', visible:false)
          ostomy_without_color = build(:ostomy, color: nil)
          expect(ostomy_without_color).to be_invalid
       end

       it 'edemaが空はNG' do
    #     @ostomy.edema = ''
    #     expect(@ostomy.valid?).to eq(false)
        #   expect(page).to have_checked_field('edema', visible:false)
          ostomy_without_edema = build(:ostomy, edema: nil)
          expect(ostomy_without_edema).to be_invalid
       end

       it 'skinが空はNG' do
    #     @ostomy.edema = ''
    #     expect(@ostomy.valid?).to eq(false)
         #expect(page).to have_checked_field('skin', visible:false)
         ostomy_without_skin = build(:ostomy, skin: nil)
         expect(ostomy_without_skin).to be_invalid
       end
    end


    describe 'アソシエーションのテスト' do
      context 'Patientモデルとの関係' do
        it 'belongs_toとなっている' do
          expect(Ostomy.reflect_on_association(:patient).macro).to eq :belongs_to
        end
      end
    end
end
