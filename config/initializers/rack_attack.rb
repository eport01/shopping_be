class Rack::Attack 
  Rack::Attack.cache.store = Rails.cache 


  Rack::Attack.throttle('products_limit', limit: 2, period: 30.seconds) do |req|
    req.ip if req.path.include?('/products') && req.get?
  end
end