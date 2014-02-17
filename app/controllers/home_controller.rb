class HomeController < ApplicationController
	before_action :signed_in_user
	layout 'application'

	def index
		@user_count = User.count
		@apply_count = DeviceApply.count

		@device_count = 0
		@sim_count = 0
		DeviceApply.all.each do |apply|
			@device_count += apply.device_num
			@sim_count += (apply.sim_num.nil? ? 0 : apply.sim_num)
		end
	end

end
