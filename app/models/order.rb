class Order < ApplicationRecord
  has_many :items, class_name: "::Order::Item"
  accepts_nested_attributes_for :items
end
