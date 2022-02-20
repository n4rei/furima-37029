class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @products = Product.all.order("created_at DESC")
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
    params.require(:product).permit(:image, :price, :name_products, :explanation, :category_id, :condition_id, :delivery_id, :ship_from_id, :ship_day_id).merge(user_id: current_user.id)
  end

end
