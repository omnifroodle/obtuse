json.array!(@witticisms) do |witticism|
  json.extract! witticism, :quote
  json.url witticism_url(witticism, format: :json)
end