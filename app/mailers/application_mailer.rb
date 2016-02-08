class ApplicationMailer < ActionMailer::Base
  default from: "service@pinkbox.com"
  layout 'mailer'
end
