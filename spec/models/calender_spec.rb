require 'rails_helper'

RSpec.describe Calender, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  
    before do  #モデルのみの作成
      @patient = build(:patient)
      @calender = build(:calender,patient: @patient)
    end

    describe 'アソシエーションのテスト' do
      context 'Patientモデルとの関係' do
        it 'belongs_toとなっている' do
          expect(Calender.reflect_on_association(:patient).macro).to eq :belongs_to
        end
      end
    end
end
