module UserToken
  class Renew < ApplicationService
    def initialize(user)
      @user = user
    end

    def call
      return error_result(I18n.t("general.user.invalid")) unless user.is_a?(User)

      user.regenerate_auth_token

      success_result
    end

    private

    attr_reader :user
  end
end
