require 'test_helper'

class PeopleControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get person" do
    get :person
    assert_response :success
  end

  test "should get delete" do
    get :delete
    assert_response :success
  end

  test "should get me" do
    get :me
    assert_response :success
  end

end
