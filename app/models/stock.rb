class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks

  def self.find_by_ticker(ticker_symbol)
    where(ticker: ticker_symbol).first
  end

  def self.new_from_search(ticker_symbole)
    StockQuote::Stock.new(api_key: 'pk_f779964c19e24d7aa8ffc428c87663c3')
    loocked_up_stock = StockQuote::Stock.quote(ticker_symbole)
    new(name: loocked_up_stock.company_name, ticker: loocked_up_stock.symbol, last_price: loocked_up_stock.latest_price)
  rescue Exception => e
    nil
  end
end
