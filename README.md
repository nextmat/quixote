Quixote
=======

A simple tool for statefully generating time-series data.

## Installation

In your shell:

    gem install quixote

Then, in your application or script:

    require 'quixote'

## Basic Usage

For each data stream you want to generate, set up a `Quixote` object. Here are some examples:

    percentage = Quixote.new(:min => 0, :max => 100, :range_by => 10)
    fahrenheit = Quixote.new(:min => -30.0, :max => 120.0, :range_by => 3.0)
    
If you don't specify any initialization options the object will be assumed to be a percentage and will default to the settings of the `percentage` object above.
    
An initial value will be randomly generated and can be accessed with `#last`:

	percentage.last #=> 58 
	
If you want to enforce a certain starting value, just set last to whatever you want:

	percentage.last = 60

By default each following value will range up or down by a random value up to a max of `range_by`. To get a series of stateful values just call `#next`:

    percentage.next #=> 64
    percentage.next #=> 66
	percentage.next #=> 58
	
You can use `#last` to retrieve the most recently generated number or move the range to a number you select at any time.
	
This makes it trivial to generate stateful runs of any length you want:

    values = []
    100.times { values << percentage.next }
    
    values #=> [49, 55, 48, …]


## Contribution

* Check the latest master to make sure the feature hasn't been implemented / the bug hasn't been fixed yet.
* Check the issue tracker to see if someone has already requested and/or contributed it.
* Fork the project and submit a pull request from a feature or bugfix branch.
* Please include tests. This is important so we don't break your changes unintentionally in a future version.
* Please don't modify the gemspec, Rakefile, version, or changelog. If you do change these files, please isolate a separate commit so we can cherry-pick around it.

## Copyright

Copyright (c) 2012 Matt Sanders. See LICENSE for details.