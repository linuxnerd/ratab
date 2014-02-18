class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	before_create :create_remember_token
	
	has_many :device_applies
	
	validates_presence_of :name, :message => '用户名不能为空'
	validates_presence_of :email, :message => '邮箱不能为空'
	validates :name, :length=>{ maximum: 50, too_long: '用户名太长了' }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, format: { with: VALID_EMAIL_REGEX, :message => '邮箱格式不正确' },
		uniqueness: { case_sensitive: false }
	validates :phone, format: { with: /\d*/, message: ' 电话只能输入数字'}
	
	has_secure_password
	validates :password, length: { minimum: 6,maximum: 16, too_short: '密码小于6位，太短了', too_long: '密码大于16位，太长了' }

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
