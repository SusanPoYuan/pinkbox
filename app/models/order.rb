class Order < ActiveRecord::Base
	has_one :info, class_name: "OrderInfo", dependent: :destroy
	has_many :items, class_name: "OrderItem", dependent: :destroy
	accepts_nested_attributes_for :info
	
	before_create :generate_token

	def generate_token
		self.token = SecureRandom.uuid
	end

	def build_items(product)
      	item = items.build
	    item.product_title = product.title
	    item.product_quantity = 1
	    item.product_price = product.price
	    item.save
    end

    def calculate_total!
		self.total = items.inject(0) {|sum, item| sum + (item.product_price * item.product_quantity)}
		self.save
    end

end
