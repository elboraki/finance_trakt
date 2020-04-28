class StocksController < ApplicationController
  def search
    @stock = Stock.new_from_search(params[:stock])
    render 'users/my_portfolio'
  end
end
