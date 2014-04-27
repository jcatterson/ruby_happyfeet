require 'test_helper'

class LookupControllerTest < ActionController::TestCase
  
  test "should get find" do
    school = schools(:one)
    get :find, { 'search' => school.name, 'obj_type' => 'School'}
    assert_operator 1, :<=, @controller.instance_variable_get(:@found).size, "We expect all schols with a name like x to be found"
  end

end
