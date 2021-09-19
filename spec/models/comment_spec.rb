require 'rails_helper'

RSpec.describe Comment, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

   before do  #モデルのみの作成
    #byebug
    @ostomy = build(:ostomy)

    @staff = build(:staff)
    @comment = build(:comment,staff: @staff, ostomy: @ostomy)
  end

 describe 'バリテーション' do
    it 'comment値が設定されていれば、OK'do
      expect(@comment.valid?).to eq(true)
    end

    it 'commentが空はNG' do
      @comment.comment = ''
      expect(@comment.valid?).to eq(false)
    end
 end

   describe 'アソシエーションのテスト' do

    context 'Ostomyモデルとの関係' do
      it '1:Nとなっている' do
        expect(Comment.reflect_on_association(:ostomy).macro).to eq :belongs_to
      end
    end

    context 'Staffモデルとの関係' do
      it '1:Nとなっている' do
        expect(Comment.reflect_on_association(:staff).macro).to eq :belongs_to
      end
    end
  end
end
