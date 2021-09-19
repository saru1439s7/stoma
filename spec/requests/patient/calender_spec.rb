require 'rails_helper'

RSpec.describe "Patient::Calenders", type: :request do
  let(:patient) { FactoryBot.create(:patient) }
  let(:calender) { FactoryBot.create(:calender, patient: patient) }

  context 'ログインしている場合' do
    before do
      sign_in patient
    end

    let(:calender_parms) do
      {
       patient_id: patient.id,
       title: "stomacare",
       body: "try"
      }
    end

    describe 'GET /patient/calenders' do
      it'カレンダー一覧表示する'do
        get patient_calenders_path
       expect(response.status).to eq 200
      end
    end
  end
end
