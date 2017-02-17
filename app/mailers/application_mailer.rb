class ApplicationMailer < ActionMailer::Base
  default from: 'tutuapp@heroku.com'
  layout 'mailer'
end
