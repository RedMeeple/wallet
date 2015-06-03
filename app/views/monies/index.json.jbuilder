json.array!(@monies) do |mony|
  json.extract! mony, :id, :other_party, :amount, :running_total
  json.url mony_url(mony, format: :json)
end
