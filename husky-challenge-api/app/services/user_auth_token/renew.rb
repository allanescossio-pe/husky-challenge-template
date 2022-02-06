module UserAuthToken
  class Renew < ApplicationService
    def initialize(user)
      @user = user
    end

    def call
      return error_result(I18n.t("general.user.errors.invalid")) unless user.is_a?(User)

      User.transaction do
        user.regenerate_auth_token
        UserAuthToken::SendMail.call(user)
      end
      success_result
    end

    private

    attr_reader :user
  end
end
