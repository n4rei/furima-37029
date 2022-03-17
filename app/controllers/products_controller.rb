class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :edit_redirect_root, only: [:edit]
  before_action :product_params_find, only: [:show, :edit, :update, :destroy]

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

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  def destroy
    if @product.user_id == current_user.id
      @product.destroy
      redirect_to root_path
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :price, :name_products, :explanation, :category_id, :condition_id, :delivery_id, :ship_from_id, :ship_day_id).merge(user_id: current_user.id)
  end

  def edit_redirect_root
    @product = Product.find(params[:id])
    if @product.user_id != current_user.id 
      redirect_to action: :index
    elsif @product.purchase.present?
      redirect_to action: :index
    end
  end

  def product_params_find
    @product = Product.find(params[:id])
  end

end
