class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end
  
  def new
    @list = List.new
  end
  
  def create
    @list = List.new(list_params)
    
    if @list.save
      redirect_to @list, notice: "List was saved successfully."
    else
      flash.now[:alert] = "Error creating list. Please try again."
      render(:new)
    end
  end
  
  def edit
    @list = List.find(params[:id])
  end
  
  def update
    @list = List.find(params[:id])
    @list.assign_attributes(list_params)
    
    if @list.save
      flash[:notice] = "List was updated."
      redirect_to(@list)
    else
      flash.now[:alert] = "Error updating list. Please try again."
      render(:edit)
    end
  end
  
  def destroy
    @list = List.find(params[:id])
    
    if @list.destroy
      flash[:notice] = "\"#{@list.name}\" was deleted successfully."
      redirect_to(lists_path)
    else
      flash.now[:alert] = "There was an error deleting the list. Please try again."
      render(:show)
    end
  end
  
  private
  
  def list_params
    params.require(:list).permit(:name, :description, :private)
  end
end