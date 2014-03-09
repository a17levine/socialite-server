json.array!(@tests) do |test|
  json.extract! test, :id, :something
  json.url test_url(test, format: :json)
end
