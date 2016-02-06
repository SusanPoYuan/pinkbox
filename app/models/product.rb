class Product < ActiveRecord::Base
	has_one :image
	accepts_nested_attributes_for :image
end
