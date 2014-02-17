class HomeController < ApplicationController
	before_action :signed_in_user
	layout 'application'

	def index
		@user_count = User.count
	end

end
