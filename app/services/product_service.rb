class ProductService 
  def self.conn
    Faraday.new(url: "https://fakestoreapi.com")
  end

  def self.get_url(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def self.products 
    get_url("/products")
  end
end