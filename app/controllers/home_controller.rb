class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @products_indices = ProductsIndex.all
    @products = Product.all
  end
end
