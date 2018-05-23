class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_group
  before_action :set_product, only: %i[show edit update destroy]

  # GET /products
  def index
    @user = current_user
  end

  # GET /products/1
  def show; end

  # GET /products/new
  def new
    @product = current_user.products.new
  end

  # GET /products/1/edit
  def edit; end

  # POST /products
  def create
    @product = current_user.products.new(product_params)
    @product.group_id = current_user.group_id 
    if @product.save
      redirect_to group_product_path(id: @product.id), notice: t(:success_create)
    else
      render :new 
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      redirect_to user_product_path(id: @product.id), notice: t(:success_update) 
    else
      render :edit 
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
    redirect_to user_products_url, notice: t(:success_destroy)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:name, :number, :user_id, :state, :due_date, :note, :price)
  end

end
