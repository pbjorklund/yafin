require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Yafin do
  describe "#get_latest_quotes" do
    it "responds to #get_latest_quotes" do
      Yafin::Fetcher.should respond_to(:get_latest_quotes)
    end

    it "should return quotes for stock symbol" do
     goog_quote = Yafin::Fetcher.get_latest_quotes(["goog"])
     goog_quote.first.symbol.should == "GOOG"
    end

    it "should return quotes for stock symbols" do
     quotes = Yafin::Fetcher.get_latest_quotes(["goog", "aapl"])
     quotes.first.symbol.should == "GOOG"
     quotes.last.symbol.should == "AAPL"
    end
  end

  describe "#get_historical_quotes" do
    it "responds to #get_historical_quotes" do
      Yafin::Fetcher.should respond_to(:get_historical_quotes)
    end

    it "gets historical quotes based on default values for a single stock when not given a timespan" do
      quotes = Yafin::Fetcher.get_historical_quotes("goog")
      quotes.count.should == 504
    end

    it "gets historical quotes when given a hash of start dates" do
      quotes = Yafin::Fetcher.get_historical_quotes("goog", { start_year: 2011, start_month: 2, start_day: 1 } )
      quotes.count.should == 232
    end

    it "gets historical quotes when given a hash of start dates and a hash of end dates" do
      quotes = Yafin::Fetcher.get_historical_quotes("goog", { start_year: 2011, start_month: 2, start_day: 1 }, { to_year: 2011, to_month: 2, to_day: 2 } )
      quotes.count.should == 2
    end
  end
end
