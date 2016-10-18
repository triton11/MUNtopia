class HomepageController < ApplicationController
	def index
		render 'homepage/index.html'
	end
	def about
		render 'homepage/instructions.html'
	end
end
