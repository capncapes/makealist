class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  
  def show
    @product = Product.find(params[:id])
  end

  def new
    @list = List.find(params[:list_id])
    @product = Product.new
  end
  
  def create
    @product = current_user.lists.products.new(product_params)
    
    if @product.save
      flash[:notice] = "Product was added to the list."
      redirect_to([@list, @product])
    else
      flash.now[:alert] = "There was an error saving the product. Please try again."
      render(:new)
    end
  end

  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    @product = Product.find(params[:id])
    
    if @product.update_attributes(product_params)
      flash[:notice] = "Product was updated."
      redirect_to(@product)
    else
      flash.now[:alert] = "There was an error updating the product. Please try again."
      render(:edit)
    end
  end
  
  def destroy
    @product = Product.find(params[:id])
    
    if @product.destroy
      flash[:notice] = "\"#{@product.name}\" was deleted successfully."
      redirect_to(@product.list)
    else
      flash.now[:alert] = "There was an error deleting the product. Please try again."
      render(:show)
    end
  end
  
  private

  def product_params
    params.require(:product).permit(:name, :description, :store1_name, :store1_link, :store1_price, :store2_name, :store2_link, :store2_price)
  end
end