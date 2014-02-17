namespace :db do
	desc "Fill database with initial user and configuration"
	task init: :environment do
		#创建用户
		User.create!(name: "SuperAdmin",
					 email: "admin@g.com",
					 password: "qwe123",
					 password_confirmation: "qwe123",
					 role: "admin")
	end
end
