class PurchasesController < ApplicationController
  before_action :product_find_params, only: [:index, :create]
  before_action :index_redirect_root, only: [:index]

  def index
    @product_purchase = ProductPurchase.new
  end

  def create
    @product_purchase = ProductPurchase.new(purchase_params)
    if @product_purchase.valid?
      pay_product
      @product_purchase.save
      redirect_to root_path
    else
      render :index
    end
    
  end


  private

  def purchase_params
    params.require(:product_purchase).permit(:postal_code, :ship_from_id, :city, :house_number, :building_name, :telephone_number).merge(user_id: current_user.id, product_id: params[:product_id],token: params[:token])
  end

  def index_redirect_root
    if @product.user_id == current_user.id || @product.purchase.present?
      redirect_to root_path
    end
  end

  def product_find_params
    @product = Product.find(params[:product_id])
  end

  def pay_product
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
