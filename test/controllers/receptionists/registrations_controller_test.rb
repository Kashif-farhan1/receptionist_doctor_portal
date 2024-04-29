require "test_helper"

class Receptionists::RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get receptionists_registrations_new_url
    assert_response :success
  end

  test "should get create" do
    get receptionists_registrations_create_url
    assert_response :success
  end
end
