require 'test_helper'

class DatauploaderTest < ActiveSupport::TestCase
  
  test "file uploaded" do
    Coach.delete_all
    file = Rack::Test::UploadedFile.new "test/roster.xlsx"
    Datauploader.upload file.path
    names = Coach.all.pluck(:first_name)
    assert_equal 6, Coach.all.size, "What are my coach names?" << names.to_s
  end
end
