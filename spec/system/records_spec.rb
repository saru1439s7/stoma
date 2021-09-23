# require 'rails_helper'

# RSpec.describe "Records", type: :system do
  # before do
  #   driven_by(:rack_test)
  # end
  # pending "add some scenarios (or delete) #{__FILE__}"

    # describe '医療スタッフ記録ページのテスト' do
    #   let(:patient) { create(patient) }
    #   let(:staff) { create(staff) }
    #   let(:record) { create(:record) }
    #   let!(:record) { create(:record, patient: patient) }

    #   describe '記録投稿画面のテスト' do
    #     before do
    #       visit new_staff_patient_record_path(patient)
    #     end
    #     context '記録投稿画面' do
    #       it '記録を作成時にエラーが出ない・ボタン選択がされる' do
    #         visit edit_user_path(other_user)
    #         expect(current_path).to eq '/users/' + user.id.to_s
    #       end
    #     end
    # end
require 'rails_helper'

RSpec.describe "Records", type: :system do
  describe '記録のページ', record: :system do
    let(:patient) { create(:patient) }
    let(:staff) { create(:staff) }
    let!(:record) { create(:record,patient: patient) }

      context 'ログインしている時' do
        before do
          FactoryBot.create(:record,patient: patient)
          visit new_staff_session_path
          fill_in 'メールアドレス', with: staff.email
          fill_in 'パスワード', with: staff.password
          click_button 'ログイン'
        end
        describe '記録作成ページ' do
          context '新規記録' do
            before do
              visit new_staff_patient_record_path    circumscribing
              expect(page).to have_checked_field('adjacent', visible:false)
              expect(page).to have_checked_field('barrier', visible:false)
              expect(page).to have_checked_field('circumscribing', visible:false)
              expect(page).to have_checked_field('discolor', visible:false)
            end
            it '投稿が保存される' do
              expect { click_button '記録' }.to change(Record.all.count).by(1)
            end
          end
        end
      end
  end
end
