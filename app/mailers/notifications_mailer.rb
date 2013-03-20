class NotificationsMailer < ActionMailer::Base
  default from: "from@example.com"
  default to: "to@example.com"

  def new_message(message)
    @message = message
    mail(:subject => "[Steps.vn] #{message.subject}")
  end

end
