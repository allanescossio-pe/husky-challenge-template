module UserAuthToken
  class Renew < ApplicationService
    def initialize(user)
      @user = user
    end

    def call
      User.transaction do
        user.regenerate_auth_token
        user.update!(auth_token_has_been_validated: false)

        UserAuthToken::SendMail.call(user)
      end
      success_result
    end

    private

    attr_reader :user
  end
end
