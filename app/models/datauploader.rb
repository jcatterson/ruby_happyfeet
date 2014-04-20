class Datauploader < Object
  def self.upload( file )
    xlsx = Roo::Excelx.new file, file_warning: :ignore
    xlsx.default_sheet = xlsx.sheets.first
    header = xlsx.row(1)
    (2..xlsx.last_row).each do |i|
      row = Hash[[header, xlsx.row(i)].transpose]
      coach = Coach.import_row row
      school = School.import_row row, coach
      student = Student.import_row row, school
    end
  end

end
