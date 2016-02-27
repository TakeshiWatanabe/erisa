class PhotoProductsController < ApplicationController
  before_action :set_photo_product, only: [:show, :edit, :update, :destroy]

  # GET /photo_products
  # GET /photo_products.json
  def index
    @photo_products = PhotoProduct.all
  end

  # GET /photo_products/1
  # GET /photo_products/1.json
  def show
  end

  # GET /photo_products/new
  def new
    @photo_product = PhotoProduct.new
  end

  # GET /photo_products/1/edit
  def edit
  end

  # POST /photo_products
  # POST /photo_products.json
  def create
    @photo_product = PhotoProduct.new(photo_product_params)

    respond_to do |format|
      if @photo_product.save
        format.html { redirect_to @photo_product, notice: 'Photo product was successfully created.' }
        format.json { render :show, status: :created, location: @photo_product }
      else
        format.html { render :new }
        format.json { render json: @photo_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photo_products/1
  # PATCH/PUT /photo_products/1.json
  def update
    respond_to do |format|
      if @photo_product.update(photo_product_params)
        format.html { redirect_to @photo_product, notice: 'Photo product was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo_product }
      else
        format.html { render :edit }
        format.json { render json: @photo_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photo_products/1
  # DELETE /photo_products/1.json
  def destroy
    @photo_product.destroy
    respond_to do |format|
      format.html { redirect_to photo_products_url, notice: 'Photo product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo_product
      @photo_product = PhotoProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_product_params
      # permit()に:image, :image_cache, :remove_imageを追加
      params.require(:photo_product).permit(:name, :price, :image, :image_cache, :remove_image)
    end
end
