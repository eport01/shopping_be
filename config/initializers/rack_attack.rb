class Rack::Attack 
  Rack::Attack.cache.store = Rails.cache 

  # def body_params
  #   unless @body_params
  #     @body_params = JSON.parse(body.read)
  #     body.rewind
  #   end
  #   @body_params
  # end

  # def api_key
  #   body_params["api_key"]
  # end
  Rack::Attack.throttle("api_key:limit-per-seconds", limit: 2, period: 30.seconds) do |req|
    # require 'pry'; binding.pry
    # body_params = JSON.parse(req.body.read)
    # req.body.to_json
    # require 'pry'; binding.pry
    if req.path.include?('/products') && req.get?
      # body_params["api_key"]
      # require 'pry'; binding.pry
      # JSON.parse(req.body.read)["api_key"]
      req.params["api_key"] 
    end
  end


  # @params = JSON.parse(req.body.read)
end