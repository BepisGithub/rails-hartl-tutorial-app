require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  # test "should get new" do
  #   get users_new_url
  #   assert_response :success
  # end

  test "new path should be signup path" do
    get signup_path
    assert_response :success
  end
end
