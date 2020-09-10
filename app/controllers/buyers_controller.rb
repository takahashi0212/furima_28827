class BuyersController < ApplicationController
  before_action :authenticate_user!
  def index
    @buyer = Buyer.new
    @product = Product.find(params[:product_id])
  end

  def create
    @product = Product.find(params[:product_id])
    @buyer = BuyerForm.new(buyer_params)
    if @buyer.valid?
      pay_product
      @buyer.save
      return redirect_to root_path
    else
      @product = Product.find(params[:product_id])
      render 'index'
    end
  end

  private
  def buyer_params
    params.permit(:price, :post_code, :zone_id, :city, :adress, :building, :phone_number, :token, :product_id).merge(user_id: current_user.id)
  end

  def pay_product
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,
      card: buyer_params[:token],
      currency: 'jpy'
    )
  end

end
