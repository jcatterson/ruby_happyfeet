module ApplicationHelper
  def lookup( obj_type, lookup_field, form=nil )
    html = ""
    lookup_field.downcase!
    html << lookup_link( obj_type, lookup_field )
    if form
      lookup_field_id = lookup_field + '_id'
      html << ( form.text_field lookup_field_id, :id=>"objects_lookup_id" ).to_s
      html << ( image_tag '/lookup.png', { class: 'lookup_icon', "student_id"=>obj_type.id } ).to_s
      html << ( render partial: "/lookup/find", :locals=>{:lookup_field=>lookup_field, :obj_type_table_name=>obj_type.class.table_name} ).to_s
    end
    
    html.html_safe
  end
  
  def lookup_link( obj_type, lookup_field )
    html = ""
    lookup_field.downcase!
    if obj_type != nil && obj_type.send( lookup_field )
      html << (link_to obj_type.send(lookup_field).name, url_for(obj_type.send(lookup_field) ), {:id=>"lookup_link"} ).to_s
    end
    
    html.html_safe
  end
end
