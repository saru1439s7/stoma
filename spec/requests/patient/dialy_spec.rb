require 'rails_helper'

RSpec.describe "Patient::Dialies", type: :request do
  let(:patient) { FactoryBot.create(:patient) }
  let(:dialy) { FactoryBot.create(:dialy, patient: patient) }

  context 'ログインしている場合' do
    before do
      sign_in patient
    end
    let(:dialy_params)do
    {
    patient_id: patient.id,
    weight: '60',
    systolic_bp: '100',
    diastolic_bp: '60',
    bt: '30 ',
    bs: '30',
    color: 'brown',
    feeling: 'usual',
    comment: 'ok'
    }
    end

    describe 'GET /patient/osotomy' do
      it '一覧ページに遷移' do
        get patient_dialies_path
        expect(response.status).to eq 200
      end
    end

    describe 'GET /patient/osotomies/:id' do
      it '詳細ページに遷移' do
        get patient_dialy_path(dialy)
        expect(response.status).to eq 200
      end
    end

    describe 'GET /patient/dialies/:id/edit' do
      it '編集ページ遷移する' do
        # binding.irb
        get edit_patient_dialy_path(dialy.id)
        expect(response.status).to eq 200
      end
    end

    describe 'POST /patient/dialies' do
      it '登録する' do
         expect{
           post patient_dialies_path(params:{dialy: dialy_params})
         }.to change { Dialy.all.count }.by(1)

        # post patient_dialies_path, params: dialy_params
        # expect(response).to redirect_to(patient_dialy_path(Dialy.first.id))
      end

    end

    describe 'PATCH /patient/dialies/:id' do
      it '更新する' do
# byebug
        patch patient_dialy_path(dialy, params:{ dialy: dialy_params})
        dialy.reload
      end
    end


  end
end
