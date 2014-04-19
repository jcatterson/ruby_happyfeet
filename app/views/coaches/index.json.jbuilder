json.array!(@coaches) do |coach|
  json.extract! coach, :id, :first_name, :last_name
  json.url coach_url(coach, format: :json)
end
