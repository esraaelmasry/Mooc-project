require 'test_helper'

class ControlControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get logout" do
    get :logout
    assert_response :success
  end

end
