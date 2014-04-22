module StudentsHelper
  def lookup( student )
    html = ""
    if student != nil && student.school != nil
      html << ( link_to student.school.name, url_for( student.school ) ).to_s
    end
    
    html << ( image_tag '/lookup.png', {class: 'lookup_icon'} ).to_s
    html << "<div>" << (render partial: "schools/find").to_s << "</div>"
    html.html_safe
  end
end
