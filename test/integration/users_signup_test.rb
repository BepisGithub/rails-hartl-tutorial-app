require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest
  test 'invalid information does not create a new user' do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: {name: 'as', email: 'asdk@ex,com', password: 'fo', password_confirmation: 'bar'}}
    end
  end

  test 'valid information creates a new user' do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: {user: {name: 'valid name', email: 'valid@email.com', password: 'foobar123', password_confirmation: 'foobar123'}}
    end
  end
end
