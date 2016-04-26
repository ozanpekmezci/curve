class OrdersController < ApplicationController

  before_filter :authenticate_user!
  def new
    @chosen_recipient = User.find_by(id: params[:id].to_i) if params[:id]
  end

  def create

  end

  def initiate
    @comment = Comment.find(params[:id])
    authorize @comment, :buy?
    order_between = Digest::SHA256.hexdigest("#{current_user.id}#{@comment.user_id}#{@comment.id}")
    @order = Order.find_by(orderhash: order_between)
    #@chat = Chat.between(current_user.id,@comment.user_id, @comment.id)
    #TODO: buraya if order status = "bla " gelecek, asagida quantity simdilik 1
    if @order.present?
      #@chat = Chat.between(params[:sender_id],params[:recipient_id]).first
      redirect_to order_path(@order.id)
    else
      if (@order = @comment.orders.create!(buyer_id: current_user.id, seller_id: @comment.user_id, orderhash: order_between,unit_price: @comment.price,quantity: 1))
        Notification.create(recipient: @order.seller, actor: @order.buyer, action: "wants to buy",notifiable: @order)
        @chat = @order.chats.create!(sender_id: @order.buyer_id, recipient_id: @order.seller_id, chathash: @order.orderhash)
      end
      redirect_to order_path(@order.id)
    end
  end

  def show
    @order = Order.find(params[:id])
    @receiver_id = interlocutor(@order)
    @receiver = User.find(@receiver_id)
    #NOTE: su first'e de biseyler gerekebilir
    @chat=@order.chats.first
    @fire = Fire.new
    @fires = @chat.fires
  end

  private


  def interlocutor(order)
    current_user.id == order.seller_id ? order.buyer_id : order.seller_id
  end
end
