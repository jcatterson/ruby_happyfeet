module ApplicationHelper
  def lookup( obj_type, lookup_field, is_editable )
    html = ""
    lookup_field.downcase!
    if obj_type != nil && obj_type.send( lookup_field )
      html << (link_to obj_type.send(lookup_field).name, url_for(obj_type.send(lookup_field) ) ).to_s
    end
    if is_editable
      html << ( image_tag '/lookup.png', { class: 'lookup_icon', "student_id"=>obj_type.id } ).to_s
      html << ( render partial: "/lookup/find", :student=>@school).to_s
    end
    
    html.html_safe
  end
end
