class InvoicesController < ApplicationController
  before_action :set_invoice, only: :show

  def index
    render json: Invoice.all
  end

  def show
    invoice = Invoice.find(params[:id])

    render json: invoice
  end

  def create
    create_invoice = Invoices::Create.call(invoice_params, current_user)

    render json: create_invoice.result, status: create_invoice.success? ? :created : :unprocessable_entity
  end

  private

  def invoice_params
    params.require(:invoice).permit(:number, :issuer, :payer, :price, :due_date)
  end
end
