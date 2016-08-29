class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@wp-todo.com'
  layout 'mailer'
end
