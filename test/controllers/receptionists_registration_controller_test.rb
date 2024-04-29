require "test_helper"

class ReceptionistsRegistrationControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get receptionists_registration_new_url
    assert_response :success
  end

  test "should get create" do
    get receptionists_registration_create_url
    assert_response :success
  end
end
