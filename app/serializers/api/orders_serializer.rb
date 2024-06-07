module Api
  class OrdersSerializer < ActiveModel::Serializer
    attributes :id, :price, :products_count, :created_date, :created_time

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
