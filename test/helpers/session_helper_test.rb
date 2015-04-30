require 'test_helper'
class SessionHelperTest < ActionView::TestCase 
  def setup
    @user=users(:bob)
    remember(@user)
  end 
  test"current_user" do
    assert_equal @user, current_user
    assert is_logged_in?
  end
  test"current user is nil when remember digest is nil" do
    @user.update_attribute(:remember_digest, User.digest(User.new_token))
    assert_nil current_user
  end
end