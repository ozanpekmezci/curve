class TransactionsController < ApplicationController
  def create
  @order = Order.find_by!(id: params[:id])
  #comment = Comment.find_by!(id: params[:id])
  token = params[:stripeToken]

  begin

    charge = Stripe::Charge.create(
      amount: @order.total_price,
      currency: "eur",
      card: token,
      description: current_user.name)

   	redirect_to transactiondone_path(guid: @order.guid)

  rescue
    @error = e
		redirect_to order_path(@order), notice: @error
  end
end

def done
  @order = Order.find_by!(guid: params[:guid])
  @comment = @order.comment
end
end
