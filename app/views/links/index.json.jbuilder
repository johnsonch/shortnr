json.array!(@links) do |link|
  json.extract! link, :id, :slug, :destination, :count
  json.url link_url(link, format: :json)
end
