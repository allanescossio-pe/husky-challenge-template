module Application
  module Base
    class ServiceValidator < Application::Base::Service
      include ActiveModel::Validations

      private

      def error_messages
        errors.messages.values.flatten
      end
    end
  end
end
