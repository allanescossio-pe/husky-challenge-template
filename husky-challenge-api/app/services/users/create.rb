module Users
  class Create < ApplicationService
    def initialize(user_params)
      @user_params = user_params
    end

    def call
      User.transaction do
        user = User.new(user_params)

        return error_result(user.errors) unless user.save

        UserAuthToken::SendMail.call(user)

        success_result(user)
      end
    end

    private

    attr_reader :user_params
  end
end
