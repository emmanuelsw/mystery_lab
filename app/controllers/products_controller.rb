class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    @product = Product.new
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(name: params[:lel][:name], price: params[:lel][:price], description: params[:lel][:description])

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_url , notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        flash[:notice] = "Esta verga se actualizó"
        format.html { redirect_to @product }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def details
    @hola = params[:details][:categoria]
    redirect_to products_url, notice: "Categoria #{@hola} añadida"
  end

  def say_hola
    @hola = params[:hola][:evento]
    redirect_to products_url, notice: "Evento #{@hola} añadido"
  end
  def evento
    @hola = params[:evento][:evento]
    redirect_to products_url, notice: "Evento chingon #{@hola} añadido"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

end
