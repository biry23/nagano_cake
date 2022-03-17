class Admin::ItemsController < ApplicationController

  belongs_to :genre
  belongs_to :order_details

end
