module Invoices
  module Validations
    class Creation < ApplicationServiceValidator
      delegate :due_date, to: :invoice, allow_nil: true

      validates_presence_of :invoice, message: I18n.t("general.errors.invoice.not_found")
      validate :due_date_is_ahead

      def initialize(invoice)
        @invoice = invoice
      end

      def call
        validate

        concat_errors if invoice.present? && !invoice.valid?

        return error_result(error_messages) if errors.any?

        success_result
      end

      private

      attr_reader :invoice

      def due_date_is_ahead
        return if due_date.blank?

        errors.add(:due_date, I18n.t("general.errors.invoice.due_date_is_behind")) if due_date.to_date < 1.day.from_now.to_date
      end

      def concat_errors
        invoice.errors.map { |error| errors.add(error.attribute, error.full_message) }
      end
    end
  end
end
