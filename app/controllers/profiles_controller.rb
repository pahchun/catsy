class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:user_id])

    @items = Item.all
  end
end
