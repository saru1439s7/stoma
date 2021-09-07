require 'test_helper'

class Patient::CalendersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get patient_calenders_index_url
    assert_response :success
  end

end
