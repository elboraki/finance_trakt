class StocksController < ApplicationController
  def search
    if params[:stock].present?
      @stock = Stock.new_from_search(params[:stock])
      if @stock
        respond_to do |format|
          format.js {render partial: "users/results"}
        end
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
