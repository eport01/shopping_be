class ProductFacade 
  def self.all_products 
    ProductService.products.map do |product_data|
      Product.new(product_data)
    end
  end
end