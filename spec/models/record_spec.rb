require 'rails_helper'

RSpec.describe Record, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
   before do  
    @patient = build(:patient)
    @record = build(:record,patient: @patient)
   end

    describe 'バリテーション' do
        it 'ABCd設定されていれば、OK'do
         expect(@record.valid?).to eq(true)
       end

       it 'adjacentが空はNG' do
          record_without_adjacent = build(:record, adjacent: nil)
          expect(record_without_adjacent).to be_invalid
          expect(record_without_adjacent.errors[:adjacent]).to eq ["を入力してください"]
       end

       it 'barrierが空はNG' do
           record_without_barrier = build(:record, barrier: nil)
           expect(record_without_barrier).to be_invalid

       end

       it 'circumscribingが空はNG' do
          record_without_circumscribing = build(:record, circumscribing: nil)
          expect(record_without_circumscribing).to be_invalid
       end

       it 'discolorが空はNG' do
          record_without_discolor = build(:record, discolor: nil)
          expect(record_without_discolor).to be_invalid
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
