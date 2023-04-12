module ProductsHelper 
  def fetch_products 
    products = $redis.get("products")

    products =  ProductSerializer.new(ProductFacade.all_products)
    $redis.set("products", products)
    #expire the cache every 5 hours 
    $redis.expire("products", 30.seconds.to_i)


    render json: products 
  end
end