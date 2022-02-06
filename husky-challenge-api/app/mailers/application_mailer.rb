class ApplicationMailer < ActionMailer::Base
  default from: "notifications@husky.com"
  layout "mailer"
end
