Pay2go.setup do |pay2go|
  if Rails.env.development?
    pay2go.merchant_id = ENV["merchant_id"]
    pay2go.hash_key    = ENV["hash_key"]
    pay2go.hash_iv     = ENV["hash_iv"]
    pay2go.service_url = ENV["service_url"]
  else
    pay2go.merchant_id = ENV["merchant_id"]
    pay2go.hash_key    = ENV["hash_key"]
    pay2go.hash_iv     = ENV["hash_iv"]
    pay2go.service_url = ENV["service_url"]
  end
end