class WeeklyMailer < ApplicationMailer
  default from: "CamFoo運営部<#{ENV['USER_EMAIL']}>"
  layout 'weekly_mailer'
  def weekly_mail
    # @url = "https://34c5c265d8024f64896296c19295b0da.vfs.cloud9.us-east-1.amazonaws.com/users/sign_in"
    @users = User.all
    @users.each do |user|
      mail(subject: "今週の状況", bcc: user.email)
    end
  end
end
