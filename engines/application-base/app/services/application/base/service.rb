module Application
  module Base
    class Service
      def self.call(*args, &block)
        new(*args, &block).call
      rescue StandardError => error
        Rails.logger.error(error)

        raise error
      end

      private

      def result(success, result_data = nil)
        OpenStruct.new(success?: success, result: result_data)
      end

      def success_result(result_data = nil)
        result(true, result_data)
      end

      def error_result(result_data = nil)
        result(false, result_data)
      end
    end
  end
end
