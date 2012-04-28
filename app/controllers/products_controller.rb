class ProductsController < ApplicationController
  
  def index
    @products = Product.all
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(params[:product])

    if @product.save
      redirect_to root_path, notice: 'Product was successfully created.'
    else
      redirect_to root_path, notice: 'Product creation failed. Make sure all fields are filled correctly.'
    end
  end

  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(params[:product])
      redirect_to root_path, notice: 'Product was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    
    redirect_to :back
  end

  def show_product
    @product = Product.find(params[:id].to_i)
    render :partial => 'show_product'
  end
end
