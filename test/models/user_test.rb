require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "users password is encrypted" do
    password = 'hello world'
    usr = User.new :name=>'hello world'
    usr.user_password = password
    assert (nil != usr.password), 'The user password should get set when the user_password gets set'
  end
  
  test "Authenticate user" do
    usr = User.create :email_address=>'hello.world@test.com', :user_password=>'something'
    authenticated_user = User.authenticate( usr.email_address, usr.user_password )
    
    assert_not nil == authenticated_user, 'We expect this user to be authenticated'
    assert_not authenticated_user.id == nil, 'we expect the user to be found from the database'
    assert usr.email_address == authenticated_user.email_address, 'We expect that the user was authenticated: ' << authenticated_user.email_address << ' expected ' << usr.email_address
  end
  
  test "Un-Authorized user" do
    User.delete_all
    usr = User.new :name=>'hello world'
    usr.user_password = 'something'
    usr.save
    authenticated_user = User.authenticate( usr.name , usr.user_password + 'xyz' )
    assert authenticated_user == nil, 'When the user enters an incorrect password, we do not expect to authorize the user' << authenticated_user.to_s
  end
  
end
