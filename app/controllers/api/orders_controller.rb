module Api
  class OrdersController < ApplicationController
    def create
      order = ::Order.new(order_params)
      total_products_count = 0
      total_price = 0

      if order.save
        cart_items = ::Cart::Item.all
        cart_items.each do |cart_item|
          order_item = ::Order::Item.new(
            order: order,
            product: cart_item.product,
            quantity: cart_item.quantity,
            price: cart_item.product.price
          )
          unless order_item.save
            render json: { error: "Failed to add order items" }, status: :unprocessable_entity
            return
          end

          total_products_count += cart_item.quantity
          total_price += cart_item.quantity * cart_item.product.price.to_i
        end

        ::Cart::Item.all.each { _1.destroy! }
        Product.all.each { _1.update!(in_cart: false) }

        order.update!(total_products_count:, total_price:)

        order_confirmation = {
          firstname: order.firstname,
          lastname: order.lastname,
          email: order.email,
          phone: order.phone
        }

        render json: { message: "Order created successfully", order_confirmation: }, status: :created
      else
        render json: { error: order.errors.full_messages.join(", ") }, status: :unprocessable_entity
      end
    end

    def index
      orders = ::Order.order(created_at: :desc)

      render json: orders, each_serializer: Api::OrdersSerializer, status: :ok
    end

    def show
      order_id = params[:id]
      order = ::Order.find(order_id)

      render json: order, serializer: Api::OrderSerializer, status: :ok
    end

    private

    def order_params
      params.require(:orderInformation).permit(:firstname, :lastname, :email, :phone)
    end
  end
end
