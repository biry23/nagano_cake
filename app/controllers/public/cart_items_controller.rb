class Public::CartItemsController < ApplicationController

  belongs_to :customer
  belongs_to :item
  
end
