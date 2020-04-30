class UserStocksController < ApplicationController
  def create
    stock = Stock.find_by_ticker(params[:stock_ticker])
    if stock.blank?
      stock = Stock.new_from_search(params[:stock_ticker])
      stock.save
    end
    @user_stock = UserStock.create(user: current_user, stock: stock)
    flash[:success] = "Stock #{@user_stock.stock.name} added succussfully"
    redirect_to my_portfolio_path
  end

  def destroy
    stock = Stock.find(params[:id])
    user_stock = UserStock.where(stock_id: stock.id, user_id: current_user.id).first
    user_stock.destroy
    flash[:notice] = 'Success stock was deleted'
    redirect_to my_portfolio_path
  end
end
