class MessageMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.contact.subject
  #
  def contact(message)
    @name = message.name
    @company = message.company
    @email = message.email
    @project_description = message.project_description

    mail to: "ParaisoGamingStudios@gmail.com", subject: "Proposal from client"
  end
end
