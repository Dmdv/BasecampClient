require 'test_helper'

class OauthControllerTest < ActionController::TestCase
  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get request_token" do
    get :request_token
    assert_response :success
  end

  test "should get token" do
    get :token
    assert_response :success
  end

  test "should get projects" do
    get :projects
    assert_response :success
  end

end
