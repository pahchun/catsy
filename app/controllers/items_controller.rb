class ItemsController < ApplicationController
  before_action :authorize_user, except: [:index, :show]

  def index
    @items = Item.all

    @search_items = Item.search(params[:search])
  end

  def show

    @item = Item.find(params[:id])
    # @test = User.find(params[:id].email)

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.seller = current_user

    if @item.save
      redirect_to @item, notice: "Item successfully posted"
    else
      render action: 'new'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :seller_id, :item_picture_url)
  end

  def authorize_user
    if !user_signed_in?
      flash[:notice] = "Please sign up to post a new item!"
      redirect_to new_user_registration_path
    end
  end
end
