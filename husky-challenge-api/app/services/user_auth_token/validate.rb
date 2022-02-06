module UserAuthToken
  class Validate < ApplicationService
    def initialize(user)
      @user = user
    end

    def call
      user.update!(auth_token_has_been_validated: true)
      success_result
    end

    private

    attr_reader :user
  end
end
