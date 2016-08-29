class UserMailer < ApplicationMailer
  require './app/lib/mail_util_congratulations'

  def completed_task(task)
    @task = task
    @user = task.user
    @congrats = MailUtilCongratulations.random_congrats
    mail(to: @user.email, subject: "Completed Task")

  end
end
