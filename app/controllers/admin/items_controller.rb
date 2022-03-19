class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path
    else
      @items = Item.all
      render :index
    end
  end

  private
  def item_params
      params.require(:item).permit(:name, :introduction, :price, :image)
  end
end
