module StudentsHelper

  def lookup( student, is_editable )
    html = ""
    if student != nil && student.school != nil
      html << ( link_to student.school.name, url_for( student.school ) ).to_s
    end
    if is_editable
      html << ( image_tag '/lookup.png', {class: 'lookup_icon',"student_id"=>student.id } ).to_s
      html << ( render partial: "shared/find" ).to_s
    end
    html.html_safe
  end
end
