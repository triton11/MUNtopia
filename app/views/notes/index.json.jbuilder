json.array!(@notes) do |note|
  json.extract! note, :id, :title, :body, :reciever, :sender
  json.url note_url(note, format: :json)
end
