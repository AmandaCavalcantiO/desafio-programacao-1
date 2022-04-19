class PurchaseOrdersController < ApplicationController
  before_action :set_orders, only: [:index, :total]
  def index
    @total = total
  end

  def destroy
    @purchase_order = PurchaseOrder.find(params[:id])
    @purchase_order.destroy
    redirect_to purchase_orders_path
  end

  def import
    begin
      PurchaseOrder.import(params[:upload][:file])
      flash[:notice] = 'Importação realizada com sucesso.'
    rescue
      flash[:alert] ='Arquivo inválido.'
    end
    redirect_to purchase_orders_path
  end

  private
    def set_orders
      @purchase_orders = PurchaseOrder.all
    end

    def total
      total = 0
      @purchase_orders. each do |order|
        total_order = order.item_price * order.purchase_count
        total += total_order
      end
      return total
    end
end
