class NotificationsMailer < ActionMailer::Base
  default from: "team@steps.vn"
  default to: "contact@steps.vn"

  def new_message(message)
    @message = message
    mail(:subject => "[Steps.vn] #{message.subject}")
  end

end
