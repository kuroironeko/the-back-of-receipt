class ProductsIndicesController < ApplicationController
  before_action :set_products_index, only: [:show, :edit, :update, :destroy]

  # GET /products_indices
  # GET /products_indices.json
  def index
    @products_indices = ProductsIndex.all
  end

  # GET /products_indices/1
  # GET /products_indices/1.json
  def show
  end

  # GET /products_indices/new
  def new
    @products_index = ProductsIndex.new
  end

  # GET /products_indices/1/edit
  def edit
  end

  # POST /products_indices
  # POST /products_indices.json
  def create
    @products_index = ProductsIndex.new(products_index_params)

    respond_to do |format|
      if @products_index.save
        format.html { redirect_to @products_index, notice: 'Products index was successfully created.' }
        format.json { render :show, status: :created, location: @products_index }
      else
        format.html { render :new }
        format.json { render json: @products_index.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products_indices/1
  # PATCH/PUT /products_indices/1.json
  def update
    respond_to do |format|
      if @products_index.update(products_index_params)
        format.html { redirect_to @products_index, notice: 'Products index was successfully updated.' }
        format.json { render :show, status: :ok, location: @products_index }
      else
        format.html { render :edit }
        format.json { render json: @products_index.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products_indices/1
  # DELETE /products_indices/1.json
  def destroy
    @products_index.destroy
    respond_to do |format|
      format.html { redirect_to products_indices_url, notice: 'Products index was successfully destroyed.' }
      format.json { head :no_content }
    end
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
