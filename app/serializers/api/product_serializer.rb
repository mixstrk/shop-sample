module Api
  class ProductSerializer < ActiveModel::Serializer
    attributes :id, :title, :price, :rest, :inCart

    def inCart
      object.in_cart || false
    end
  end
end
