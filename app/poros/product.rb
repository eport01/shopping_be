class Product
  attr_reader :id, :title, :price, :category, :description, :image 
  def initialize(attributes)
    @id = attributes[:id]
    @title = attributes[:title]
    @price = attributes[:price]
    @category = attributes[:category]
    @description = attributes[:description]
    @image = attributes[:image]

  end
end