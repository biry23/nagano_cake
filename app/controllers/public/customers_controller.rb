class Public::CustomersController < ApplicationController
  
  has_many :cart_items
  has_many :orders
  has_many :addresses
  
end
