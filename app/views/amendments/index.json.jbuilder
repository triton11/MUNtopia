json.array!(@amendments) do |amendment|
  json.extract! amendment, :id, :title, :passed, :body, :resolution_id
  json.url amendment_url(amendment, format: :json)
end
