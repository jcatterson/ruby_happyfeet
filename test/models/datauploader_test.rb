require 'test_helper'

class DatauploaderTest < ActiveSupport::TestCase
  
  test "file uploaded" do
    Coach.delete_all
    School.delete_all
    Student.delete_all
    
    file = Rack::Test::UploadedFile.new "test/roster.xlsx"
    Datauploader.upload file.path
    
    names = Coach.all.pluck(:first_name)
    schools = School.all.pluck(:name)
    students = Student.all
    assert_equal 6, Coach.all.size, "What are my coach names?" << names.to_s
    assert_equal 20, School.all.size, "What are my schools? " << schools.to_s
    assert_equal 260, students.size, "We expect all rows to be students"
  end
end
