json.array!(@attendances) do |attendance|
  json.extract! attendance, :id, :school_id, :coach_id, :attendance_date
  json.url attendance_url(attendance, format: :json)
end
