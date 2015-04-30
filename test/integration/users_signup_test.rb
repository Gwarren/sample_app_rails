require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  require 'test_helper'

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
    before_count = User.count
      post users_path, user: { name:"", 
                              email: "invalid@invalid.com",
                              password: "foo", 
                              password_confirmation: "bar"}
    end
    assert_template "users/new"
  end
    test "valid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post_via_redirect users_path, user: { name:"Grant", 
                              email: "Grant@grant.com",
                              password: "imgrant", 
                              password_confirmation: "imgrant"}
    end
    assert_template "users/new"
    assert is_logged_in? 
    
  end
end
