class StocksController < ApplicationController
  def search
    if params[:stock].present?
      @stock = Stock.new_from_search(params[:stock])
      if @stock
        render 'users/my_portfolio'
      else
        flash[:danger] = 'You have entred wrong symbol'
        redirect_to my_portfolio_path
      end
    else
      flash[:danger] = 'You have empty search'
      redirect_to my_portfolio_path
    end
  end
end
