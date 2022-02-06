class UserTokenMailer < ApplicationMailer
  def generated(user)
    @user = user

    mail(to: @user.email, subject: "Token de acesso gerado")
  end
end
