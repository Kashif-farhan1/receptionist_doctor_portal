require "test_helper"

class DoctorsRegistrationControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get doctors_registration_new_url
    assert_response :success
  end

  test "should get create" do
    get doctors_registration_create_url
    assert_response :success
  end
end
