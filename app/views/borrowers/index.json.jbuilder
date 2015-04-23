json.array!(@borrowers) do |borrower|
  json.extract! borrower, :id, :name, :phone, :nickname, :email
  json.url borrower_url(borrower, format: :json)
end
