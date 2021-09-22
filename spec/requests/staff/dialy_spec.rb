require 'rails_helper'

RSpec.describe "Staff::Dialies", type: :request do
  let(:staff) { FactoryBot.create(:staff) }
  let(:patient) { FactoryBot.create(:patient) }
  let(:dialy) { FactoryBot.create(:dialy, patient: patient) }

  context 'ログインしている場合' do
    before do
      sign_in staff
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

    describe 'GET /staff/osotomy' do
      it '一覧ページに遷移' do
        get staff_dialies_path
        expect(response.status).to eq 200
      end
    end

    describe 'GET /staff/osotomies/:id' do
      it '詳細ページに遷移' do
        get staff_dialy_path(dialy)
        expect(response.status).to eq 200
      end
    end

  end
end
