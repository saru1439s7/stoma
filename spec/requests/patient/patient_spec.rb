require 'rails_helper'

RSpec.describe "Patient::Patients", type: :request do
  before do
    # 登録しているpatientを使うのでcreateとします。
    @patient = FactoryBot.create(:patient)
    # deviseのメソッドであるsign_inでログインしています。
    sign_in @patient
  end
  describe 'GET #show' do
    context 'ユーザーが存在する場合' do
      let(:takashi) { FactoryBot.create :takashi }

      it 'リクエストが成功すること' do
        get patient_patient_path takashi.id
        #expect(response.status).to eq 200#APIの時
        # expect(response.status).to eq(200)
      end

      it 'ユーザー名が表示されていること' do
        get patient_patient_path @patient.id
        expect(response.body).to include 'TEST_NAME#{n}'
      end
    end
  end

  describe 'GET #edit' do
   let(:@patient) { FactoryBot.create :@patient }

    it 'リクエストが成功すること' do
      get edit_patient_patient_path @patient
      expect(response.status).to eq(200)
    end

    it 'ユーザー名が表示されていること' do
      get edit_patient_patient_path @patient
      expect(response.body).to include "TEST_NAME#{n}"
    end

    it 'ユーザー名かなが表示されていること' do
      get edit_patient_patient_path takashi
      expect(response.body).to include 'たかし'
    end

    it 'メールアドレスが表示されていること' do
      get edit_patient_patient_path takashi
      expect(response.body).to include 'takashi@example.com'
    end
    it 'passwordが表示されていること' do
      get edit_patient_patient_path takashi
      expect(response.body).to include 'たかし'
    end
  end


  describe 'PUT #update' do
  let(:takashi) { FactoryBot.create :takashi }

    context 'パラメータが妥当な場合' do
      it 'リクエストが成功すること' do
        put patient_patient_path @patient, params: { patient: FactoryBot.attributes_for(:patient) }
        expect(response.status).to eq 302
      end

      it 'ユーザー名が更新されること' do
        expect do
        put patient_patient_path takashi, params: { patient: FactoryBot.attributes_for(:patient) }
        end.to change { Patient.find(patient.id).name }.from('Takashi').to('Satoshi')
      end

      it 'リダイレクトすること' do
        put patient_patient_path patient, params: { patient: FactoryBot.attributes_for(:patient) }
        expect(response).to redirect_to patient_patient_path(patient)
      end
    end

    context 'パラメータが不正な場合' do
      it 'リクエストが成功すること' do
        put patient_patient_path @patient, params: { patient: FactoryBot.attributes_for(:patient, :invalid) }
        expect(response.status).to eq 200
      end

      it 'ユーザー名が変更されないこと' do
        expect do
          put patient_patient_path takashi, params: { patient: FactoryBot.attributes_for(:patient, :invalid) }
        end.to_not change(Patient.find(takashi.id), :name)
      end

      it 'エラーが表示されること' do
        put patient_patient_path takashi, params: { patient: FactoryBot.attributes_for(:patient, :invalid) }
        expect(response.body).to include 'prohibited this patient from being saved'
      end
    end
  end
end
