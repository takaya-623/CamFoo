class WeeklyMailer < ApplicationMailer
  default from: "CamFoo運営部<#{ENV['USER_EMAIL']}>"
  def weekly_mail
    @users = User.all
    @users.each do |user|
      mail(bcc: user.email,
        subject: 'お知らせ',
        template_path: 'weekly_mailer',
        template_name: 'weekly_mail')
    end
    @cooks = Cook.where(created_at: 0.days.ago.prev_week..0.days.ago.prev_week(:sunday)).count
  end
end
