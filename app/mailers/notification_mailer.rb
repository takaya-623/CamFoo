class NotificationMailer < ApplicationMailer
  default from: "CamFoo運営部<#{ENV['USER_EMAIL']}>"

  def complete_mail(user)
    @user = user
    @url = "http://camfoo-portfolio.work/users/#{user.id}"
    mail(subject: "CamFooに登録いただきありがとうございます", to: user.email)
  end
end
