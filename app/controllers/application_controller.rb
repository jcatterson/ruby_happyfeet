class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def find
    @found = []
    if params[:school_name]
      cls = constantize_with_care([School], "School")
      @found = cls.by_like_name params[:school_name]
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def constantize_with_care(list_of_klasses = [], cls = "" )
    list_of_klasses.each do |klass|
      if cls == klass.to_s
        return cls.constantize
      end
    end
    
    raise "Not allowed to constantize #{cls}"

  end
end
