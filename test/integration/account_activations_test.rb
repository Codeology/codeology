require 'test_helper'

class AccountActivationsTest < ActionDispatch::IntegrationTest

  def setup
    ActionMailer::Base.deliveries.clear
    @user = users(:userone)
    # create_activation_digest is a private method so we use send instead to call it directly 
    @user.send(:create_activation_digest)
    @user.update_attribute(:activated, false)
  end
  
  test "expired token" do
    @user.update_attribute(:activation_sent_at, 4.hours.ago)
    get edit_account_activation_path(@user.activation_token, email:@user.email)
    assert_response :redirect
    assert !@user.activated
    follow_redirect!
    assert_template '/'
  end

  test "unexpired token" do
    @user.update_attribute(:activation_sent_at, 2.hours.ago)
    get edit_account_activation_path(@user.activation_token, email:@user.email)
    assert_response :redirect
    @user.reload
    assert @user.activated
    follow_redirect!
    assert_template '/'
  end
end