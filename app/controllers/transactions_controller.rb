class TransactionsController < ApplicationController
  before_action :logged_in, only: [:new]

  def new
    unless !@item_to_borrow.nil?
      redirect_to root_url
    end
  end

  def create
    @item_to_borrow = Stationery.find(params[:item_id])
    @user = User.find(params[:borrower_id])
    if current_user.id == params[:borrower_id].to_i
      render 'new'
    else
      redirect_to root_url
    end
  end

  private

    def item_params
      #tbc
    end

    def logged_in
      unless user_signed_in?
        redirect_to root_url
      end
    end
end
