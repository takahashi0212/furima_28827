class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def product_params
    params.require(:product).permit(:image, :name, :description, :category_id, :status_id, :cost_id, :zone_id, :days_id, :price).merge(user_id: current_user.id)
  end
end


#"product"=>{"hoge"=>"1000", "category_id"=>"3", "status_id"=>"3", "cost_id"=>"2", "zone_id"=>"1", "days_id"=>"2"}