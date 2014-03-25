class UserMailer < ActionMailer::Base
  default from: "来自RATAB"

  def reset_password_email(user)
    @user = user
    @password_reset_url = Settings.BASE_URL + '/users/password_reset?' + @user.password_reset_token
    mail(:to => user.email, :subject => 'RATAB重置密码邮件')
  end
end
