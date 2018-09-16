require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  test "should get home" do
    get root_path
    assert_response :success
  end

  test "should get about us" do
    get about_path
    assert_response :success
  end

  test "should get calendar" do
    get calendar_path
    assert_response :success
  end

  test "should get projects" do
    get projects_path
    assert_response :success
  end

end
