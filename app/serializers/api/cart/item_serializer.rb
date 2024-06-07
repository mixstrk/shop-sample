module Api
  module Cart
    class ItemSerializer < ActiveModel::Serializer
      attributes :id, :title, :price, :rest, :quantity

      def id
        object.product_id
      end

      def title
        object.product.title
      end

      def price
        object.product.price
      end

      def rest
        object.product.rest
      end

      def quantity
        object.quantity
      end
    end
  end
end
