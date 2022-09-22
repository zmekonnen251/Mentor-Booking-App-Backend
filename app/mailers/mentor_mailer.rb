class MentorMailer < ApplicationMailer
  default from: 'zmekonnen59@gmail.com'
  layout 'mailer'

  def mentor_approved(email)
    @email = email
    mail(to: @email, subject: 'Your request is now accepted', body: 'You can see your self on mentor booking app mentors list page, http://localhost:3001/auth/sign_in')
  end

  def mentor_banned(email)
    @email = email
    mail(to: @email, subject: 'You are temporarly banned from mentor booking app', body: 'Your account is now banned')
  end

  def mentor_removed(email)
    @email = email
    mail(to: @email, subject: 'You are removed from mentor booking app', body: 'You are removed from mentor booking app')
  end
end
