class LookupController < ApplicationController
  def find
    @found = []
    if params[:search] && params[:obj_type]
      cls = constantize_with_care( params[:obj_type] )
      @found = cls.by_like_name params[:search]
    end
    @url = '/' << ActiveModel::Naming.plural( cls ) << '/found'
    respond_to do |format|
      format.js
      format.html { render :nothing=>true }
    end
  end
  
  def set_lookup
    @field_to_set = params["foreign_key_field"]
    foreign_keys_type = constantize_with_care( params[:foreign_key_field] )
    school = foreign_keys_type.find params["foreign_key"]
    
    @student = Student.find params['id']
    @student.school_id = school.id
    
    respond_to do |format|
      format.js {}
      format.html { render :nothing=>true }
    end
  end

  # Should make this by all models that contains the scope "by_like_name"
  def constantize_with_care( cls = "" )
    list_of_klasses = safe_to_constantize
    list_of_klasses.each do |klass|
      if cls.downcase == klass.to_s.downcase
        return klass
      end
    end
    
    raise "Not allowed to constantize #{cls}"

  end
  
  private
    def safe_to_constantize
      [School, Coach]
    end
end
