class WeeklyMailer < ApplicationMailer
  default from: "CamFoo運営部<#{ENV['USER_EMAIL']}>"
  def weekly_mail
    # @url = "https://34c5c265d8024f64896296c19295b0da.vfs.cloud9.us-east-1.amazonaws.com/users/sign_in"
    @users = User.all
    @users.each do |user|
      #mail(subject: "今週の状況", bcc: user.email)
      mail(bcc: user.email,
        subject: '今週の状況',
        template_path: 'weekly_mailer',
        template_name: 'weekly_mail')
    end
  end
end
