class ProductsController < ApplicationController
  before_action :find_user

  def index 
    # render json: ProductSerializer.new(ProductFacade.all_products)  
    product_cache = Rails.cache.read(['products_data', @user])
    if product_cache == nil
      product_cache = ProductFacade.all_products
      Rails.cache.write(['products_data', @user], product_cache, expires_in: 1.minute)
      render json: ProductSerializer.new(product_cache)
    else
      render json: ProductSerializer.new(product_cache)
    end
  end

  private 
  def find_user
    @user = current_user
  end

end