class UserMailer < ApplicationMailer
  require './app/lib/mail_util_congratulations'

  def completed_task(task, congrats)
    @task = task
    @user = task.user
    @congrats = congrats
    mail(to: @user.email, subject: "Completed Task")

  end
end
