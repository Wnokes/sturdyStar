class SupportMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.support_mailer.contact.subject
  #
  def contact(support)
    @name = support.name
    @email = support.email
    @body = support.body

    mail to: "paraisogamingstudios@gmail.com", subject: "Support message"
  end
end
