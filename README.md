yafin
=====

Yafin is a gem to pull quotes from Yahoo finance.

Usage
-----

Get the latest quotes for an array of stock symbols
```ruby
Yafin::Fetcher.get_latest_quotes(["goog", "aapl"])
```

Get historical quotes for a stock symbol
```ruby
Yafin::Fetcher.get_historical_quotes("goog")

Yafin::Fetcher.get_historical_quotes("goog", { start_year: 2011, start_month: 2, start_day: 1 } )

Yafin::Fetcher.get_historical_quotes("goog", { start_year: 2011, start_month: 2, start_day: 1 }, { to_year: 2011, to_month: 2, to_day: 2 } )
```

Quotes is an array of Yafin::Quote and historical_quotes is an array of Yafin::Historical_quotes

Contributing to yafin
---------------------
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

Copyright
---------

Copyright (c) 2012 Patrik Björklund. See LICENSE.txt for
further details.

