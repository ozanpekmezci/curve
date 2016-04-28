class TransactionsController < ApplicationController
  before_action :authenticate_user!
  def create
  @order = Order.find_by!(id: params[:id])
  #comment = Comment.find_by!(id: params[:id])


    result = Braintree::Transaction.sale(
      :amount => @order.total_price,
      :payment_method_nonce => params[:payment_method_nonce]
      :options => {
        :submit_for_settlement => true
      }
    )

  if result.success?
 	  redirect_to transactiondone_path(guid: @order.guid)

  else
	  redirect_to order_path(@order), notice: result.errors
  end

def done
  @order = Order.find_by!(guid: params[:guid])
  @comment = @order.comment
end
end
