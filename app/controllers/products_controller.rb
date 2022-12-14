class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @emptyProduct = Product.select(:quantity).where(quantity: 0)
  end

end
