class Admin::ProductsController < ApplicationController
	layout "admin"

	def index
		@products = Product.all
	end

	def new
		@product = Product.new
		@image = @product.build_image
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to admin_products_path
		else
			render :new
		end
	end

	def edit
		@product = Product.find(params[:id])
		if @product.image.present?
			@image = @product.image
		else
			@pimage = @product.build_image
		end
	end
	
	def update
		@product = Product.find(params[:id])
		if @product.update
			redirect_to admin_products_path
		else
			render :edit
		end
	end
	
	private
	
	def product_params
		params.require(:product).permit(:title, :price, :description, :number, image_attributes: [:image, :id])
	end
end
