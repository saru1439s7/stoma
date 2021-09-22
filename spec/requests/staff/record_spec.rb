require 'rails_helper'

RSpec.describe "Staff::Records", type: :request do
  let(:staff) { FactoryBot.create(:staff) }
  let(:patient) { FactoryBot.create(:patient) }
  let(:record) { FactoryBot.create(:record, patient: patient) }

  context 'ログインしている場合' do
    before do
      sign_in staff
    end
    let(:record_params)do
    {
    patient_id: patient.id,
    adjacent: 'acceptable',
    barrier: 'acceptable',
    circumscribing: 'acceptable',
    discolor: 'acceptable',
    h_size: '30 ',
    w_size: '30',
    comment: 'ok',
    #image: '',
    }
    end

    describe 'GET /staff/patients/:patient_id/records/new' do
      it '新規(投稿)記録ページに遷移' do
        get new_staff_patient_record_path(patient)
        expect(response.status).to eq 200
      end
    end

    describe 'GET /staff/patients/:patient_id/records' do
      it '一覧ページに遷移' do
        get staff_patient_records_path(patient)
        expect(response.status).to eq 200
      end
    end

    describe 'GET /staff/patients/:patient_id/records/:id' do
      it '詳細ページに遷移' do

        get staff_patient_record_path(patient,record)
        expect(response.status).to eq 200
      end
    end

    describe 'GET /staff/patients/:patient_id/records/:id/edit' do
      it '編集ページ遷移する' do
        get edit_staff_patient_record_path(patient,record)
        expect(response.status).to eq 200
      end
    end

    describe 'POST /staff/patients/:patient_id/records' do
      it '登録する' do
        expect{
          post staff_patient_records_path(patient,params:{record: record_params})
        }.to change { Record.all.count }.by(1)
      end
    end

    describe 'PATCH /patient/ostomies/:id' do
      it '更新する' do

        patch staff_patient_record_path(record,patient,params:{record: record_params})
        record.reload
      end
    end
  end
end
