require 'rails_helper'

RSpec.describe "Staff::Patients", type: :request do
  let(:patient){FactoryBot.create(:patient)}

  context 'ログインしている場合' do
    before do
      @patient = FactoryBot.create(:patient)
      @staff = FactoryBot.create(:staff)
      sign_in @staff
    end

    let(:patient_params) do
      {
        name: 'name',
        name_kana: 'name_kana',
        email: 'patient@patient',
        password: 'patient'
      }
    end

    describe 'GET /staff/patients' do
        it '一覧ページに遷移' do
          get staff_patients_path
          expect(response.status).to eq 200
        end
    end

    describe 'GET /staff/patients/:id' do
      it '詳細ページに遷移' do
        get staff_patient_path(patient)
        expect(response.status).to eq 200
      end
    end

    describe 'GET /staff/staffs/:id/edit' do
      it '編集ページ遷移する' do
        get edit_staff_patient_path(patient)
        expect(response.status).to eq 200
      end
    end

    describe 'PATCH /staff/patients/:id' do
      it '更新する' do
        patch staff_patient_path(patient, params:{ patient: patient_params})
        patient.reload
      end
    end
  end
end