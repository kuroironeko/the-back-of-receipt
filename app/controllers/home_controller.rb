class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @products_indices = ProductsIndex.where(group_id: current_user.group_id)
    @products = Product.all
  end
end
