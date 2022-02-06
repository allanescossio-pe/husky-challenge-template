module UserAuthToken
  class SendMail < ApplicationService
    def initialize(user)
      @user = user
    end

    def call
      UserTokenMailer.generated(user).deliver_later

      success_result
    end

    private

    attr_reader :user
  end
end
