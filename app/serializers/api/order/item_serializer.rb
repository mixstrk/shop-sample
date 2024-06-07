module Api
  module Order
    class ItemSerializer < ActiveModel::Serializer
      attributes :id, :title, :price, :quantity, :subtotal_price

      def title
        object.product.title
      end

      def subtotal_price
        object.price.to_i * object.quantity
      end
    end
  end
end
