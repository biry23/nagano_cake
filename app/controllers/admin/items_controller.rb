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

  def index
    @items = Item.page(params[:page])
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  private
  def item_params
      params.require(:item).permit(:name, :introduction, :price, :image, :genre_id, :is_active)
  end
end
