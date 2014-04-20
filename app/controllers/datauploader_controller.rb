class DatauploaderController < ApplicationController
  def index

  end
  
  def upload
    Datauploader.upload params[:file]
  end
end
