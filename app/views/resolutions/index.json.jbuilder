json.array!(@resolutions) do |resolution|
  json.extract! resolution, :id, :title, :passed, :body
  json.url resolution_url(resolution, format: :json)
end
