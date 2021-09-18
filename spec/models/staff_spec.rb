require 'rails_helper'

RSpec.describe Staff, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  before do  
    @staff = build(:staff)
  end

 describe 'バリテーション' do
    it 'name,email値が設定されていれば、OK' do
      expect(@staff.valid?).to eq(true)
    end

    it 'nameが空はNG' do
      @staff.name = ''
      expect(@staff.valid?).to eq(false)
    end

    it 'emailが空はNG' do
      @staff.email = ''
      expect(@staff.valid?).to eq(false)
    end
 end
end
