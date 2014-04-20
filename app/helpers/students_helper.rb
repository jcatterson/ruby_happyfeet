module StudentsHelper
  def lookup( student )
    if student != nil && student.school != nil
      link_to student.school.name, url_for( student.school )
    end
  end
end
