module Invoices
  class Create < ApplicationService
    def initialize(invoice_params, user)
      @invoice_params = invoice_params
      @user = user
    end

    def call
      Invoice.transaction do
        invoice = Invoice.new(invoice_params.merge({ user: user }))

        invoice_validation = Invoices::Validations::Creation.call(invoice)

        return error_result(invoice.errors) unless invoice_validation.success?

        invoice.save

        success_result(invoice)
      end
    end
    private

    attr_reader :invoice_params, :user
  end
end
