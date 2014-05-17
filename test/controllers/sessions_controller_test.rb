require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  test "get new" do
    get :new
    assert :success
  end
  
  test "login" do
    dave = users(:one)
    post :create, :name=>dave.email_address, :password=>'test'
    assert_redirected_to coaches_url
    assert_equal dave.id, session[:user_id]
  end
  
  test "should fail login" do
    dave = users(:one)
    post :create, :name=>dave.email_address, :password=>'wrong!'
    assert_redirected_to login_url
  end
  
  test "should logout" do
    delete :destroy
    assert_redirected_to login_url
  end

end
