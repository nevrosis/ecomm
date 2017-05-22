class TransactionsController < ApplicationController

  def create
    item = Item.find_by!(slug: params[:slug])
    sale = item.sales.create(
      amount: item.price,
      buyer_email: current_user.email,
      seller_email: item.user.email,
      stripe_token: params[:stripeToken]
    )
    sale.process!

    if sale.finished?
      redirect_to pickup_url(uuid: sale.uuid)
    else
      redirect_to item_path(book), notice: e.message
    end

  end

  def pickup
    @sale = Sale.find_by!(uuid: params[:uuid])
    @item = @sale.item
  end

end
