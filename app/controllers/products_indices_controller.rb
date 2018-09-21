class ProductsIndicesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_group
  before_action :set_products_index, only: %i[show edit update destroy]

  # GET /products_indices
  def index
    @products_indices = ProductsIndex.where(group_id: current_user.group_id)
  end

  # GET /products_indices/1
  def show; end

  # GET /products_indices/new
  def new
    @products_index = ProductsIndex.new
  end

  # GET /products_indices/1/edit
  def edit; end

  # POST /products_indices
  def create
    @products_index = ProductsIndex.new(products_index_params)
    @products_index.group_id = current_user.group_id
    if @products_index.save
      redirect_to group_products_index_path(id: @products_index.id), notice: t(:success_create)
    else
      render :new
    end
  end

  # PATCH/PUT /products_indices/1
  def update
    if @products_index.update(products_index_params)
      redirect_to group_products_index_path(id: @products_index.id), notice: t(:success_update)
    else
      render :edit
    end
  end

  # DELETE /products_indices/1
  def destroy
    @products_index.destroy
    redirect_to products_indices_url, notice: t(:success_destroy)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_products_index
    @products_index = ProductsIndex.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def products_index_params
    params.require(:products_index).permit(:name)
  end
end
