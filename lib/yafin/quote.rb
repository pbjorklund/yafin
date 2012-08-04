class Yafin::Quote
  attr_accessor :symbol, :name, :last_trade, :change, :change_percent, :exchange

  def initialize args=[]
    self.symbol         = args[0]
    self.name           = args[1]
    self.last_trade     = args[2]
    self.change         = args[3]
    self.change_percent = args[4]
    self.exchange       = args[5]
  end

  def to_s
    "Symbol: #{symbol} Name: #{name} Last trade: #{last_trade} Change: #{change} Change %: #{change_percent} Exchange: #{exchange}"
  end
end

