class ProductsController < ApplicationController
  before_action :find_user

  def index 
    if @user != nil && params[:api_key]

      # render json: ProductSerializer.new(ProductFacade.all_products)  
      product_cache = Rails.cache.read(['products_data', @user])
      if product_cache == nil
        product_cache = ProductFacade.all_products
        Rails.cache.write(['products_data', @user], product_cache, expires_in: 1.minute)
        render json: ProductSerializer.new(product_cache)
      else
        render json: ProductSerializer.new(product_cache)
      end
    else 
      render json: {error: "Please create an account to receive an API key"}
    end
  end

  private 
  def find_user
    @user = User.find_by(api_key: params[:api_key])
    # @user = current_user
  end

end