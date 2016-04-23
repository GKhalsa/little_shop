class InvoicesController < ApplicationController
  before_action :require_login, only: [:index]

  def create
    order = Order.create(date: Time.now.strftime("%m/%d/%Y"))
    invoices = InvoiceCreation.new(@cart, current_user, order)
    invoices.create
    session[:cart] = {}
    redirect_to orders_path
  end

  def index
    @order = Order.find(params[:order_id])
    @invoices = @order.invoices
  end

  private

  def require_login
    redirect_to login_path unless current_user
  end
end