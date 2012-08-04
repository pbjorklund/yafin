class Yafin::HistoricalQuote
  attr_accessor :symbol, :date, :open, :high, :low, :close, :volume, :adj_close

  def initialize args, symbol
    self.date      = args[0]
    self.open      = args[1]
    self.high      = args[2]
    self.low       = args[3]
    self.close     = args[4]
    self.volume    = args[5]
    self.adj_close = args[6]
    self.symbol    = symbol
  end
end
