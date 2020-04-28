class Stock < ApplicationRecord
  def self.new_from_search(ticker_symbole)
    StockQuote::Stock.new(api_key: 'pk_f779964c19e24d7aa8ffc428c87663c3')
    loocked_up_stock = StockQuote::Stock.quote(ticker_symbole)
    new(name: loocked_up_stock.company_name, ticker: loocked_up_stock.symbol, last_price: loocked_up_stock.latest_price)
  end
end
