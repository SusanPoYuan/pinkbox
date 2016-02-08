class OrdersController < ApplicationController
	
	def choose
		@products = Product.all
	end

	def checkout
		@product = Product.find(params[:id])
		@order = Order.new
		@order.build_items(@product)
		@order.calculate_total!
		@info = @order.build_info
	end 

	def show
		@order = Order.find(params[:id])
		@order_info = @order.info
		@order_items = @order.items
	end

	def update
		@order = Order.find(params[:id])
		if @order.update(order_params)
			Ordermailer.delay.notify_order_placed(@order)
			redirect_to order_path(@order)
		else
			render :checkout
		end
	end

	private
	def order_params
		params.require(:order).permit( info_attributes: [:email, :billing_name, :billing_address, :shipping_name, :shipping_address])
	end
end
