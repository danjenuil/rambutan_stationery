class TransactionsController < ApplicationController
  include ApplicationHelper
  before_action :logged_in, only: [:new, :full_history]

  def new
    unless !@item.nil?
      redirect_to root_url
    end
  end

  def create
    @item = Stationery.find_by(id: item_params[:item_id])
    if @item && (current_user.id == item_params[:borrower_id].to_i)
      @quantity = item_params[:quantity].to_i
      new_quantity = @item.quantity - @quantity
      @transact = current_user.transactions.create(stationery_id: @item.id, 
                                                  quantity: item_params[:quantity].to_i, 
                                                  needs_return: !@item.consumable? ? true : false,
                                                  due_date: needs_due_date(@item), 
                                                  returned_date: nil)
      @item.update_attributes(quantity: new_quantity)
      flash[:success] = "Transaction was successful!"
      redirect_to action: "new"
    else
      flash[:danger] = "Transaction was unsuccessful, please try again."
      redirect_to stationery_path
    end
  end

  def return
    @item_to_return = Transaction.find_by(id: params[:item_to_be_returned])
    quantity_to_return = @item_to_return.quantity
    @stationery = Stationery.find_by(id: @item_to_return.stationery_id)
    current_quantity = @stationery.quantity
    if @item_to_return
      @item_to_return.update_attributes(returned_date: DateTime.now)
      @stationery.update_attributes(quantity: quantity_to_return + current_quantity)
      flash[:success] = "Item returned successfully!"
      redirect_to root_path
    else
      flash[:danger] = "Error: Item could not be returned"
      redirect_to root_path
    end
  end

  def full_history
    @history = Transaction.where(user_id: current_user.id, needs_return: true).where.not(returned_date: nil)
  end

  private

  def item_params
    params.require(:transaction).permit(:item_id, :borrower_id, :quantity)
  end

  def logged_in
    unless user_signed_in?
      redirect_to root_url
    end
  end
end