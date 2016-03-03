class Admin::BaseController < ApplicationController
	before_filter :check_admin

	def check_admin
		unless current_user.present? && current_user.email == "mpilarz@elyxx.com"
	  		flash[:danger] = "You cannot access restricted area."
	  		redirect_to root_url
	  	end
	end
end