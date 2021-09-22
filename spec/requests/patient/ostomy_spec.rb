require 'rails_helper'

RSpec.describe "Patient::Ostomies", type: :request do
  let(:patient) { FactoryBot.create(:patient) }
  let(:ostomy) { FactoryBot.create(:ostomy, patient: patient) }

  context 'ログインしている場合' do
    before do
      sign_in patient
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

    describe 'GET /patient/osotomy' do
      it '一覧ページに遷移' do
        get patient_ostomies_path
        expect(response.status).to eq 200
      end
    end

    describe 'GET /patient/osotomies/:id' do
      it '詳細ページに遷移' do
        get patient_ostomy_path(ostomy)
        expect(response.status).to eq 200
      end
    end

    describe 'GET /patient/ostomies/:id/edit' do
      it '編集ページ遷移する' do
        get edit_patient_ostomy_path(ostomy.id)
        expect(response.status).to eq 200
      end
    end

    describe 'POST /patient/ostomies' do
      it '登録する' do
        expect{
          post patient_ostomies_path(params:{ostomy: ostomy_params})
        }.to change { Ostomy.all.count }.by(1)
      end
    end

    describe 'PATCH /patient/ostomies/:id' do
      it '更新する' do
        patch patient_ostomy_path(ostomy, params:{ ostomy: ostomy_params})
        ostomy.reload
        #expect(Ostomy.first.color).to eq 'pink'
      end
    end


  end
end
