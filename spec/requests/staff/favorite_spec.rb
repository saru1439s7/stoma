require 'rails_helper'

RSpec.describe "Staff::Favorites", type: :request do
  let(:staff){FactoryBot.create(:staff)}
  let(:ostomy){FactoryBot.create(:ostomy)}
  let(:patient){FactoryBot.create(:patient)}
  let!(:favorite){FactoryBot.create(:favorite, staff: staff, ostomy: ostomy)}

  context 'ログインしている場合' do
   before do
     @staff = FactoryBot.create(:staff)
     sign_in staff
   end

   let(:ostomy_params)do
    {
    patient_id: patient.id,
    color: 'pink',
    edema: 'normal',
    skin: 'same',
    h_size: '30 ',
    w_size: '30',
    comment: 'ok',
    #image: '',
    }
    end



    describe 'PATCH /staff/ostomies/:ostomy_id/favorites' do
      it 'いいねを押す' do
        patch staff_ostomy_favorites_path(ostomy, params:{ ostomy:ostomy_params})
        # (ostomy, params:{ ostomy:ostomy_params})
        favorite.reload
      end
    end

     describe 'DELETE /staff/ostomies/:ostomy_id/favorites' do
      it 'いいね取り消す' do
        p '-------------'
        p Favorite.all.count
        expect{
          delete staff_ostomy_favorites_path(ostomy)
         }.to change { Favorite.all.count }.by(-1)
    
        p Favorite.all.count
        p '-------------'
      end
     end

    end
  end

