class DatauploaderController < ApplicationController
  def index

  end
  
  def upload
    Datauploader.upload params[:file].path
    respond_to do |format|
      format.html { redirect_to students_url }
    end
  end
end
