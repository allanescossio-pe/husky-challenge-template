module Login
  class Execute < ApplicationService
    def initialize(user_auth_token)
      @user_auth_token = user_auth_token
    end

    def call
      user = User.find_by(auth_token: user_auth_token)
      user_validated = Login::Validate.call(user)

      return error_result(user_validated.result) unless user_validated.success?

      success_result(user)
    end

    private

    attr_reader :user_auth_token
  end
end
