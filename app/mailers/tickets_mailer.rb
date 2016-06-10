class TicketsMailer < ApplicationMailer
  def create(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: I18n.t('tickets_mailer.create.subject'))
  end

  def destroy(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: I18n.t('tickets_mailer.destroy.subject'))
  end
end
