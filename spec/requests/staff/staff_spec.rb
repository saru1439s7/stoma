require 'rails_helper'
RSpec.describe "Staff::Staffs", type: :request do
  
  let(:staff){FactoryBot.create(:staff)}
  
  context 'ログインしている場合' do
    before do
      # 登録しているpatientを使うのでcreateとし
      @staff = FactoryBot.create(:staff)
      # deviseのメソッドであるsign_inでログイン
      sign_in @staff
    end
    let(:staff_params)do
    {
     name: 'name',
     email: 'staff@staff',
     password: 'staffstaff'
    }
    end
    
   describe 'GET /staff/staff' do
      it '一覧ページに遷移' do
        get staff_staffs_path
        expect(response.status).to eq 200
      end
    end

    describe 'GET /staff/staffs/:id' do
      it '詳細ページに遷移' do
        get staff_staff_path(staff)
        expect(response.status).to eq 200
      end
    end
    
    describe 'GET /staff/staffs/:id/edit' do
      it '編集ページ遷移する' do
        get edit_staff_staff_path(staff.id)
        expect(response.status).to eq 200
      end
    end
    
    describe 'PATCH /staff/staffs/:id' do
      it '更新する' do
        patch staff_staff_path(staff, params:{ staff: staff_params})
        staff.reload
      end
    end
    
  end
end
