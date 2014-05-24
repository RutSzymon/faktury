class InvoicesController < ApplicationController
  before_action :invoice, only: [:show, :edit]
  before_action :sidebar

  def index
  end

  def show
    @company = Company.first
  end

  def new
    @invoice = Invoice.new
  end

  def create
    @invoice = Invoice.new(invoice_params)
    if invoice.orders.present? && invoice.save
      redirect_to invoice, notice: "Utworzono poprawnie"
    else
      alert
      render :new
    end
  end

  def edit
  end

  def update
    invoice.assign_attributes(invoice_params)
    if invoice.orders.present? && invoice.save
      redirect_to invoice, notice: "Zaktualizowano poprawnie"
    else
      alert
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

  def other_products
    products = Product.other(params[:product_ids])
    render json: products.select{ |p| params[:term].in?(p.name) }
  end

  private
  def invoice_params
    params.require(:invoice).permit(:date, :payment_time, :contractor_id,
      orders_attributes: [:id, :invoice_id, :product_id, :quantity, :_destroy])
  end

  def invoice
    @invoice ||= Invoice.find(params[:id])
  end

  def sidebar
    @invoices = Invoice.all
  end

  def alert
    no_orders = invoice.orders.empty?
    flash[:alert] = no_orders ? "Dodaj chociaż jeden produkt" : "Niektóre pola są niepoprawne"
  end
end