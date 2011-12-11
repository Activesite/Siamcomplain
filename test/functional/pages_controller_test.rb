require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get contactUs" do
    get :contactUs
    assert_response :success
  end

end
