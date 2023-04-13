# class Rack::Attack 
#   Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new 

#   throttle('products_ip', limit: 2, period: 20.seconds) do |req|
#     if req.path == '/products' && req.get? 
#       req.params[session[:user_id]].presence 

#     end
#   end
# end