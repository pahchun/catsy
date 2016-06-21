class ProfilesController < ApplicationController
  def show
    purchased_item_params
    @user = User.find(params[:user_id])
    @items = @user.items_for_sale
    @purchased_items = @user.items

  end

  def destroy
    @item = current_user.items.find(params[:id])
    @item.destroy
    redirect_to user_profile_path
  end

  private

  def purchased_item_params
    if params[:item_id] && !params[:item_id].empty?
      PurchasedItem.create(
        buyer_id: params[:user_id].to_i,
        item_id: params[:item_id].to_i
      )
      redirect_to user_profile_path(current_user)
    end
  end
end
