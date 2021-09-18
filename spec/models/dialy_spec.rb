require 'rails_helper'

RSpec.describe Dialy, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  
    before do  #モデルのみの作成　#belongs_toのときだけ
      @patient = build(:patient)
      @dialies = build(:dialies,patient: @patient)
    end

    describe 'アソシエーションのテスト' do
      context 'Patientモデルとの関係' do
        it 'belongs_toとなっている' do
          expect(Record.reflect_on_association(:patient).macro).to eq :belongs_to
        end
      end
    end
end
