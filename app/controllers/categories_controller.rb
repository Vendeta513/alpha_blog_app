class CategoriesController < ApplicationController
  
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(set_params)
    if @category.save
      flash[:notice] = "Category was successfully created"
      redirect_to @category
    else
      render 'new'
    end
  end

  def index
    
  end

  def show
    
  end

  private
  
  def set_params
    params.require(:category).permit(:name)    
  end
end