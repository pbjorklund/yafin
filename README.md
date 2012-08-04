yafin
=====

Yafin is a gem to pull quotes from Yahoo finance.

Usage
-----

```ruby
y = Yafin.new

quotes = y.get_latest_quotes(["goog", "aapl"])

historical_quotes = y.get_historical_quotes("goog", "2011", "2", "1", "2011", "3", "1")
```

Syntax is symbol, start_year=2000, start_month=1, start_day=1, to_year=2012, to_month=1, to_day=1

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

