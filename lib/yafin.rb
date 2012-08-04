require 'csv'

class Yafin
  def get_latest_quotes symbols
    # Enter symbols to fetch at f=
    # s = symbol
    # n = name
    # l1 = last trade (price only)
    # c1 = Change
    # p2 = Change in percent
    # x = Stock exchange
    #
    # Full list at http://www.gummy-stuff.org/Yahoo-data.htm

    ####### GOOG RESPONSE ##########################################
    #    s          n           l1       c1       p2         x
    # ["GOOG", "Google Inc.", 585.245, -0.735, "-0.13%", "NasdaqNM"]
    ####### GOOG RESPONSE ##########################################
    
    sym = symbols.join("+")

    resp = Net::HTTP.get_response(URI.parse("http://download.finance.yahoo.com/d/quotes.csv?s=#{sym}&f=snl1c1p2x&e=.csv"))
    quotes = resp.body.split(/\r\n/)

    quotes.inject([]) do |sum, q| 
      sum << Quote.new(CSV.parse(q).flatten) 
    end
  end

  def get_historical_quotes symbol, start_year=2000, start_month=1, start_day=1, to_year=2012, to_month=1, to_day=1

    # http://ichart.yahoo.com/table.csv?s=GOOG&a=0&b=1&c=2000&d=0&e=31&f=2010
    # "Date,Open,High,Low,Close,Volume,Adj Close"
    
    resp = Net::HTTP.get_response(URI.parse("http://ichart.yahoo.com/table.csv?s=#{symbol}&a=#{start_month.to_i - 1}&b=#{start_day}&c=#{start_year}&d=#{to_month.to_i - 1}&e=#{to_day}&f=#{to_year}"))

    quotes = resp.body.split(/\n/)

    quotes.delete_at 0 #Strip headings from response

    sum = quotes.inject([]) { |sum, q| sum << HistoricalQuote.new(CSV.parse(q).flatten, symbol) }
    
  end
end

