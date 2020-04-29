class StocksController < ApplicationController
  def search
    if params[:stock].blank?
      flash.now[:danger] = 'You have entered an empty search string'
    else
      @stock = Stock.new_from_search(params[:stock])
      flash.now[:danger] = 'You have entered an incorrect symbol' unless @stock
    end
    respond_to do |format|
      format.js { render partial: 'users/results' }
    end
  end
end
