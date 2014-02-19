class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	before_create :create_remember_token
	
	has_many :device_applies
	
	validates_presence_of :name, message: '用户名不能为空'
	validates_presence_of :email, message: '邮箱不能为空'
	validates :name, :length=>{ maximum: 50, too_long: '用户名太长了' }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, format: { with: VALID_EMAIL_REGEX, :message => '邮箱格式不正确' },
		uniqueness: { case_sensitive: false }
	validates :phone, format: { with: /\A\+?[\d]*-?[\d]*\z/, message: ' 电话只能输入数字'}

	validates_presence_of :password_confirmation, :within=>6..16, message:'新密码长度不正确，应该在6到16位之间', if: lambda { |m| m.password.present? }
	#validates_confirmation_of :password
	#validates_length_of :password, :within => 6..16, message: '新密码长度不正确，应该在6到16位之间', on: :create
	
	# rails自带
	has_secure_password

	# 修改密码
	attr_reader :current_password
	def update_password(user_params)
		current_password = user_params.delete(:current_password)
		
		p "@@@@@@@@@@#{self.password.present?}"

		if self.authenticate(current_password)
			self.update(user_params)
		else
			self.errors.add(:current_password, current_password.blank? ? '旧密码不能为空' : '旧密码输入不正确')
			false
		end
	end
	
	def validates_of_update_password
		if self.password.nil? || self.password.blank?
			self.errors.add(:password, '新密码不能为空')
			false
		else
			true
		end
	end
	
	
	
	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	def admin?
		self.role == 'admin'
	end

	private
		def create_remember_token
			self.remember_token = User.encrypt(User.new_remember_token)
		end
end
