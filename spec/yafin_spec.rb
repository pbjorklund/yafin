require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Yafin do
  describe "#get_latest_quotes" do
    it "responds to #get_latest_quotes" do
      subject.should respond_to(:get_latest_quotes)
    end

    it "should return quotes for stock symbol" do
     goog_quote = subject.get_latest_quotes(["goog"])
     goog_quote.first.symbol.should == "GOOG"
    end

    it "should return quotes for stock symbols" do
     quotes = subject.get_latest_quotes(["goog", "aapl"])
     quotes.first.symbol.should == "GOOG"
     quotes.last.symbol.should == "AAPL"
    end
  end

  describe "#get_historical_quotes" do
    it "responds to #get_historical_quotes" do
      subject.should respond_to(:get_historical_quotes)
    end

    before(:each) do
      @quotes = subject.get_historical_quotes("goog", "2011", "2", "1", "2011", "3", "1")
    end

    it "gets historical quotes for a single stock given a timespan" do
      @quotes.count.should == 20
    end
  end
end
