class InvoicesController < ApplicationController
  before_action :invoice, only: [:show, :edit]
  before_action :sidebar

  def index
  end

  def show
  end

  def new
    @invoice = Invoice.new
  end

  def create
    @invoice = Invoice.new(invoice_params)
    if invoice.save
      redirect_to invoice, notice: "Utworzono poprawnie"
    else
      flash[:alert] = "Niektóre pola są niepoprawne"
      render :new
    end
  end

  def edit
  end

  def update
    if invoice.update_attributes(invoice_params)
      redirect_to invoice, notice: "Zaktualizowano poprawnie"
    else
      flash[:alert] = "Niektóre pola są niepoprawne"
      render :edit
    end
  end

  def destroy
    if invoice.destroy
      redirect_to :invoices, notice: "Usunięto poprawnie"
    else
      flash[:alert] = "Wystąpił błąd podczas usuwania"
      redirect_to invoice
    end
  end

  def other_contractors
    render json: Contractor.select{ |c| params[:term].in?(c.name) }
  end

  private
  def invoice_params
    params.require(:invoice).permit(:date, :payment_time, :contractor_id)
  end

  def invoice
    @invoice ||= Invoice.find(params[:id])
  end

  def sidebar
    @invoices = Invoice.all
  end
end