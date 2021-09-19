require 'rails_helper'

RSpec.describe Patient, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  before do  #モデルのみの作成
     @patient = build(:patient)
  end

  describe 'バリデーション' do
    it 'name,name_kana,email,password値が全て設定されていれば、OK' do
      expect(@patient.valid?).to eq(true)
    end

    it 'nameが空だとNG' do
      @patient.name = ''
      expect(@patient.valid?).to eq(false)
    end

    it 'name_kanaが空はNG' do
      @patient.name_kana = ''
      expect(@patient.valid?).to eq(false)
    end

    it 'emailが空だとNG' do
      @patient.email = ''
      expect(@patient.valid?).to eq(false)
    end

    it 'passwordが空だとNG' do
      @patient.password = ''
      expect(@patient.valid?).to eq(false)
    end
  end

end
