class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :only=>[:upload]

  # GET /attendances
  # GET /attendances.json
  def index
    @attendances = Attendance.all
  end

  # GET /attendances/1
  # GET /attendances/1.json
  def show
  end
  
  def upload

  	attendance_line_items = JSON.parse params[:attendance_records]
  	coach = Coach.find_by_user_id session[:user_id]

  	school_record = Attendance.create :attendance_date=>DateTime.current, :school_id=>params[:school_id], :coach_id=>coach.id

  	attendance_line_items.each do |record|
  	  record = record.to_hash
  	  student = Student.find_by_id record["student"]["id"]
  	  
  	  updated_student = record["student"]
  	  
  		student_attendance = StudentAttendance.new record["attendance"]
  		student_attendance.student_id = student.id
  		student_attendance.attendance_id = school_record.id
      student.update updated_student.to_hash
  		
  		student_attendance.save
  	end
  	
  	respond_to do |format|
  		format.json { render :json=>school_record.to_json }
  	end
  end

  # GET /attendances/new
  def new
    @attendance = Attendance.new
  end

  # GET /attendances/1/edit
  def edit
  end

  # POST /attendances
  # POST /attendances.json
  def create
    @attendance = Attendance.new(attendance_params)

    respond_to do |format|
      if @attendance.save
        format.html { redirect_to @attendance, notice: 'Attendance was successfully created.' }
        format.json { render action: 'show', status: :created, location: @attendance }
      else
        format.html { render action: 'new' }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attendances/1
  # PATCH/PUT /attendances/1.json
  def update
    respond_to do |format|
      if @attendance.update(attendance_params)
        format.html { redirect_to @attendance, notice: 'Attendance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendances/1
  # DELETE /attendances/1.json
  def destroy
    @attendance.destroy
    respond_to do |format|
      format.html { redirect_to attendances_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendance_params
      params.require(:attendance).permit(:school_id, :coach_id, :attendance_date)
    end
end
