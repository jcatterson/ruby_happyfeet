class LookupController < ApplicationController
  def find
    @found = []
    if params[:search] && params[:obj_type]
      cls = constantize_with_care( [School, Coach], params[:obj_type] )
      @found = cls.by_like_name params[:search]
    end
    @url = '/' << ActiveModel::Naming.plural( cls ) << '/found'
    
    respond_to do |format|
      format.js
      format.html { render :nothing=>true }
    end
  end

  # Should make this by all models that contains the scope "by_like_name"
  def constantize_with_care(list_of_klasses = [], cls = "" )
    list_of_klasses.each do |klass|
      if cls == klass.to_s
        return cls.constantize
      end
    end
    
    raise "Not allowed to constantize #{cls}"

  end
end
