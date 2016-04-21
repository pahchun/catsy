class ItemsController < ApplicationController
  before_action :authorize_user, except: [:index, :show]

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to @item, notice: "Item successfully posted"
    else
      render action: 'new'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :item_photo)
  end
end
