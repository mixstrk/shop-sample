module Api
  module Cart
    class ItemsController < ApplicationController
      def index
        items = ::Cart::Item.order(created_at: :desc)
  
        render json: items, each_serializer: Api::Cart::ItemSerializer
      end

      def create
        product_id = params[:product_id]
  
        product = ::Product.find(product_id)
  
        cart = ::Cart.first_or_create
  
        cart_item = ::Cart::Item.create!(cart:, product:)
  
        if cart_item.persisted?
          product.update!(in_cart: true)

          render json: { success: true, cart_item: }, status: :created
        else
          render json: { error: 'Failed to add item to cart' }, status: :unprocessable_entity
        end
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Product not found' }, status: :not_found
      end

      def update
        product_id = params[:id] 
        product = ::Product.find(product_id)
        quantity = params[:quantity]
        cart_item = ::Cart::Item.find_by(product_id:)

        if cart_item.update(quantity: quantity)
          render json: { success: true, cart_item: }, status: :ok
        else
          render json: { error: 'Failed to update item quantity' }, status: :unprocessable_entity
        end
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Cart item not found' }, status: :not_found
      end
  
      def destroy
        product_id = params[:id] 
        product = ::Product.find(product_id)
        cart_item = ::Cart::Item.find_by(product_id:)
  
        cart_item.destroy!
        product.update!(in_cart: false)
  
        head :no_content
      rescue ActiveRecord::RecordNotFound
        head :not_found
      end

      def items_count
        count = ::Cart::Item.count

        render json: { count: count }
      end

      def destroy_all
        ::Cart::Item.all.each { _1.destroy! }
        Product.all.each { _1.update!(in_cart: false) }

        render json: { deleted: "ok" } if ::Cart::Item.count.zero? && Product.where(in_cart: true).empty?
      end
    end
  end
end
