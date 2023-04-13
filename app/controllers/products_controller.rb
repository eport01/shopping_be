class ProductsController < ApplicationController

  def index 

    render json: ProductSerializer.new(ProductFacade.all_products)  
  end
end