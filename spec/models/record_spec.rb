require 'rails_helper'

RSpec.describe Record, type: :model do
  let(:record) {FactoryBot.create(:record) }

   before do
    # let(:record) {FactoryBot.create(:record) }
    # describe 'enum' do
    #   it { is_expected.to enum(:adjacent).with_values(acceptable:0,erythema:1,erosion:2,blister:3,ulceration:15).with_prefix}
    #   it { is_expected.to define_enum_for(:barrier).with_values(acceptable:0,erythema:1,erosion:2,blister:3,ulceration:15).with_prefix }
    #   it { is_expected.to define_enum_for(:circumscribing).with_values(acceptable:0,erythema:1,erosion:2,blister:3,ulceration:15).with_prefix }
    #   it { is_expected.to define_enum_for(:discolor).with_values(acceptable:0,spot:1,depigmentation:2,both:3).with_prefix }
    # end
   end

    describe 'バリテーション' do
      it 'ABCD設定されていれば、OK'do
        expect(record.valid?).to eq(true)
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

    describe 'ABCモデルの計算テスト' do
      context 'enumで設定したA+B+Cの合計が計算される' do
        it "A+B+Cの合計計算する" do
         expect(record.point).to eq 0
         record.adjacent = "erythema"
         record.save
         expect(record.point).to eq 1
         record.adjacent = "erosion"
         record.save
         expect(record.point).to eq 2
         record.adjacent = "blister"
         record.save
         expect(record.point).to eq 3
         record.adjacent = "ulceration"
         record.save
         expect(record.point).to eq 15
        end
      end
    end
end
