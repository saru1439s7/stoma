require 'rails_helper'
RSpec.describe "Staff::Comments", type: :request do
  let(:staff) { FactoryBot.create(:staff) }
  let(:ostomy) { FactoryBot.create(:ostomy) }
  let(:comment) { FactoryBot.create(:comment, staff: staff,ostomy: ostomy) }

    context 'ログインしている場合' do
      before do
        @staff = FactoryBot.create(:staff)
        sign_in staff
      end
      let (:comment_params) do
      {
      ostomy_id: ostomy.id,
      staff_id: staff.id,
      comment: "ok"
      }
      end

      describe 'POST /staff/ostomies/:ostomy_id/comments' do
        it 'コメントする' do
          expect{
            post staff_ostomy_comments_path(ostomy,params:{comment: comment_params})
          }.to change { Comment.all.count }.by(1)
        end
      end
    end
end
