module Api
  class OrderSerializer < ActiveModel::Serializer
    attributes :id, :firstname, :lastname, :email, :phone,
      :price, :products_count, :created_date, :created_time

    has_many :items, serializer: Order::ItemSerializer, key: :products

    def price
      object.total_price
    end

    def products_count
      object.total_products_count
    end

    def created_date
      object.created_at.strftime("%B %d, %Y")
    end

    def created_time
      object.created_at.strftime("%H:%M")
    end
  end
end
