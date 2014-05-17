require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    session[:user_id] = @user.id
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    User.delete_all( "id != #{@user.id.to_s}" )
    assert_difference 'User.count', 1, 'what are the errors then?' do
      res = post :create, user: { email_address: @user.email_address << 'test2', user_password: 'test', user_password_confirmation: 'test', name: 'test' }
    end

    assert_redirected_to user_path assigns(:user)
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { name: @user.name, user_password: @user.password }
    assert_redirected_to user_path assigns( :user )
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
