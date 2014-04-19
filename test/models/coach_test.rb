require 'test_helper'

class CoachTest < ActiveSupport::TestCase
  
  test "first name and last name" do
    coach = Coach.new :first_name=>'test', :last_name=>'test'
    assert_equal 'test test', coach.full_name, 'We expect the first and last name to be concatenated with a space in between'
  end
end
