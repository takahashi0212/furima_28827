class BuyersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_buyer, only: [:index, :create]
  before_action :product_sold?, only: [:index]
  def index
    @buyer = Buyer.new
    if current_user.id == @product.user.id
      redirect_to root_path
    else
      render 'index'
    end
  end

  def create
    @buyer = BuyerForm.new(buyer_params)
    if @buyer.valid?
      pay_product
      @buyer.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  def set_buyer
    @product = Product.find(params[:product_id])
  end


  private
  def buyer_params
    params.permit(:price, :post_code, :zone_id, :city, :adress, :building, :phone_number, :token, :product_id).merge(user_id: current_user.id)
  end

  def product_sold?
    if @product.purchase
      redirect_to root_path
    end
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
