require 'test_helper'

class AttendancesControllerTest < ActionController::TestCase
  setup do
    @attendance = attendances(:one)
    @user = users(:one)
    session[:user_id] = @user.id
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attendances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "create attendance records" do
  	Attendance.delete_all
  	StudentAttendance.delete_all
  	
  	coach = coaches(:one)
  	school = schools(:one)
  	
  	student_one_record = StudentAttendance.new( :student_id=>students(:one), :did_attend=>true )
  	student_two_record = StudentAttendance.new( :student_id=>students(:two), :did_attend=>false )
  	
  	student_records = [student_one_record, student_two_record]

  	post :upload, attendance_records: student_records.to_json, :school_id=>school.id, :format=>'json'
  	
  	attendances = Attendance.where :school_id=>school.id
  	assert_equal 1, attendances.size, 'When student records is called, we expect an attendance record to get created'
  	assert_equal attendances[0].id, JSON.parse( @response.body )["id"].to_i, 'When the parse was successful, we expect the response to retun the json version of the Attendance record'
  	
  	student_attendances = StudentAttendance.where :attendance_id=>attendances[0].id
  	assert_equal 2, student_attendances.size, 'When we pass two students for attendances for uploading, we expect the records to get created'
  	
  end

  test "should create attendance" do
    assert_difference('Attendance.count') do
      post :create, attendance: { attendance_date: @attendance.attendance_date, coach_id: @attendance.coach_id, school_id: @attendance.school_id }
    end

    assert_redirected_to attendance_path(assigns(:attendance))
  end

  test "should show attendance" do
    get :show, id: @attendance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attendance
    assert_response :success
  end

  test "should update attendance" do
    patch :update, id: @attendance, attendance: { attendance_date: @attendance.attendance_date, coach_id: @attendance.coach_id, school_id: @attendance.school_id }
    assert_redirected_to attendance_path(assigns(:attendance))
  end

  test "should destroy attendance" do
    assert_difference('Attendance.count', -1) do
      delete :destroy, id: @attendance
    end

    assert_redirected_to attendances_path
  end
end
