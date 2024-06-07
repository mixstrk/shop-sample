module Api
  class ProductsController < ApplicationController
    def index
      products = Product.order(created_at: :desc)

      render json: products, each_serializer: Api::ProductSerializer
    end

    def show
      product_id = params[:id]
      product = ::Product.find(product_id)

      render json: product, serializer: Api::ProductSerializer
    end
  end
end
