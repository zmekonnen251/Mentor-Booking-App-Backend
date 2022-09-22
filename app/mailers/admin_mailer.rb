class AdminMailer < ApplicationMailer
  default from: 'zmekonnen59@gmail.com'
  layout 'mailer'

  def new_mentor_waiting_for_approval(email)
    @email = email
    mail(to: 'zmekonnen59@gmail.com', subject: 'New mentor request awaiting admin approval')
  end
end
