class Cart < ApplicationRecord
  has_many :cart_items, class_name: "::Cart::Item", dependent: :destroy
  has_many :products, through: :cart_items
end
