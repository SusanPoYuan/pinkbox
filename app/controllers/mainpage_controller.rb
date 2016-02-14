class MainpageController < ApplicationController

	def index
		set_page_title "Welcome"
	end

	def code
  		self.link.split('/').last if self.link
	end
end
