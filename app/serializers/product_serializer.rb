class ProductSerializer
  include JSONAPI::Serializer 
  set_id {nil}
  attributes :id, :title, :price, :category, :description, :image
end