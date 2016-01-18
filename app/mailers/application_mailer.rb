class ApplicationMailer < ActionMailer::Base
  from_address = ENV['FROM_ADRESS'] || "from@example.com"
  default from: from_address
  layout 'mailer'
end
