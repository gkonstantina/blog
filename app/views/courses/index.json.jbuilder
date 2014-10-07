json.array!(@courses) do |course|
  json.extract! course, :id, :title, :text
  json.url course_url(course, format: :json)
end
