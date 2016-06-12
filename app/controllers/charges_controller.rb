class ChargesController < ApplicationController
  def new
    @total = 0
    current_user.items.each do |item|
      @total += item.price
    end
  end

  def create
    #Amount in current_user
    @amount = 0
    current_user.items.each do |item|
      @amount += item.price
    end

    customer = Stripe::Customer.create(
      :email => 'hello@gmail.com',
      :card => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer => customer.id,
      :amount => @amount,
      :description => 'Carrie Customer',
      :currency => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
end
