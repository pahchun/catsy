class ItemsController < ApplicationController
  before_action :authorize_user, except: [:index, :show, :search]

  def index
    # @items = Item.all
    @items = Item.all.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @item = Item.find(params[:id])
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

  def search
    @items = Item.search(params[:search])
    if params[:search] == ""
      flash[:error] = "Please enter your search"
      redirect_to '/items'
    elsif @items.empty?
      flash[:error] = "No match found"
      redirect_to '/items'
    else
      render :index
    end
  end


  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :seller_id, :item_picture_url, :category_id)
  end

  def authorize_user
    if !user_signed_in?
      flash[:notice] = "Please sign up to post a new item!"
      redirect_to new_user_registration_path
    end
  end
end
