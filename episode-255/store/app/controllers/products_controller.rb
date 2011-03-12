class ProductsController < ApplicationController
  
  def index
    @products = Product.released_at_desc
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(params[:product])
    if @product.save
      flash[:notice] = "Successfully created product. #{undo_link}"
      redirect_to @product
    else
      render :action => 'new'
    end
  end
  
  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      flash[:notice] = "Successfully updated product. #{undo_link}"
      redirect_to @product
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Successfully destroyed product. #{undo_link}"
    redirect_to products_url
  end
  
  private
  
  def undo_link
    @template.link_to("undo", revert_version_path(@product.versions.scoped.last), :method => :post)
  end
end
