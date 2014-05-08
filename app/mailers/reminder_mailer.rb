class ReminderMailer < ActionMailer::Base
  default from: 'tech@brownmotionpictures.org'

  def reservation_due_email(user)
    @user = user
    @url = 'http://brownmotionpictures.org'
    mail(to: @user.email, subject: 'Your BMP Reservation is due')
  end
end
