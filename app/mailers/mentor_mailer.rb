class MentorMailer < ApplicationMailer
  default from: 'zmekonnen59@gmail.com'
  layout 'mailer'

  def mentor_approved(email)
    @email = email
    mail(to: @email, subject: 'Your account is now approved', body: 'Your account is now approved,you can login now, http://localhost:3001/auth/sign_in')
  end

  def mentor_banned(email)
    @email = email
    mail(to: @email, subject: 'Your account is now banned', body: 'Your account is now banned,you can login now, http://localhost:3001/auth/sign_in')
  end
end
