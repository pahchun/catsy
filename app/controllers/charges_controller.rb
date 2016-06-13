class ChargesController < ApplicationController
  def new
    @total = 0
    current_user.items.each do |item|
      @total += item.price
    end
    binding.pry
  end

  def create
    #Amount in current_user
    @amount = 0
    current_user.items.each do |item|
      @amount += item.price
    end

    customer = Stripe::Customer.create(
      :email => current_user.email,
      :card => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer => customer.id,
      :amount => (@amount.to_i)*100,
      :description => current_user.items.name,
      :currency => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
end
