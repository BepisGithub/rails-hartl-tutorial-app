require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest

    
  test 'login with invalid information' do
    get login_path
    post login_path, params: {session: {email: 'invalid@invalid,org', password: 'foo'}}
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
  
end
