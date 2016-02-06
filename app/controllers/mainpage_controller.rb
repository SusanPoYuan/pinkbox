class MainpageController < ApplicationController

	def code
  		self.link.split('/').last if self.link
	end
end
