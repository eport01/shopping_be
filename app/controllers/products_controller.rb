class ProductsController < ApplicationController
  include ProductsHelper
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  def index 
    fetch_products
    # require 'pry'; binding.pry
    # render json: ProductSerializer.new(fetch_products)  
  end
end