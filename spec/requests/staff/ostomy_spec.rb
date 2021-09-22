require 'rails_helper'

RSpec.describe "Staff::Ostomies", type: :request do
  let(:staff) {FactoryBot.create(:staff)}
  let(:patient) { FactoryBot.create(:patient) }
  let(:comment){FactoryBpt.creae(:comment, staff: staff,ostomy: osotmy)}
  let(:ostomy) { FactoryBot.create(:ostomy, patient: patient) }

  context 'ログインしている場合' do
    before do
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

    describe 'GET /staff/ostomies/index/:patient_id' do
      it '一覧ページに遷移' do
        get staff_ostomy_index_path(patient)
        expect(response.status).to eq 200
      end
    end

    describe 'GET /staff/ostomies/show/:ostomy_id/:patient_id' do
      it '詳細ページに遷移' do
        get staff_ostomy_show_path(ostomy,patient)
        expect(response.status).to eq 200
      end
    end


  end
end
