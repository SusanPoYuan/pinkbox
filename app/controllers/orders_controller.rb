class OrdersController < ApplicationController
	layout "order"

	def choose
		set_page_title "選擇方案"
		@products = Product.all
	end

	def checkout
		@order = Order.new
		@info = @order.build_info

		@product = Product.find(params[:id])
		cookies[:product_id] = params[:id]
		set_page_title @product.title
	end 

	def show
		set_page_title "Thank you"
		@order = Order.find_by_token(params[:id])
		@order_info = @order.info
		@order_items = @order.items
	end

	def edit
		@order = Order.find_by_token(params[:id])
	end

	def create
		@order = Order.new(order_params)
		@product = Product.find(cookies[:product_id])
		@order.build_items(@product)
		@order.calculate_total!
		if @order.save
			Ordermailer.delay.notify_order_placed(@order)
			#Ordermailer.notify_order_placed(@order).deliver!
			redirect_to order_path(@order.token)
		else
			render checkout_orders_path
		end
	end

	def update
		@order = Order.find(params[:id])
		if @order.update(order_params)
			redirect_to order_path(@order.token)
		else
			render edit_order_path
		end
	end
	
	def pay2go_atm_complete
		@order = Order.find_by_token(params[:id])
		json_data = JSON.parse(params["JSONData"])

		if json_data["Status"] == "SUCCESS"
			@order.set_payment_with!("atm")
			@order.make_payment!
			render text: "交易成功"
		else
			render text: "交易失敗"
		end
	end

	private
	def order_params
		params.require(:order).permit( info_attributes: [:email, :billing_name, :billing_address, :shipping_name, :shipping_address])
	end
end
