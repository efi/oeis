# OEIS Sequences for Ruby
Compact and simple Ruby implementations of a handful of random entries from the "[The On-Line Encyclopedia of Integer Sequences®](https://oeis.org/)"

Really just a sportive exercise in Ruby coding. They may be helpful for others to learn about `include Enumerable` or a starting point for you to implement your own favorite sequence.

```ruby
irb(main):001:0> require 'oeis'
=> true

irb(main):002:0> OEIS.sequences.count
=> 10

irb(main):003:0> OEIS.sequences.sample
=> OEIS::A006928

irb(main):004:0> OEIS::A003418.first(10)
=> [1, 2, 6, 12, 60, 60, 420, 840, 2520, 2520]

irb(main):005:0> seq = OEIS::A003418.new
=> #<OEIS::A003418:0x312b34e3 @counter=0, @factors={}, @step=#<Proc:0x26844abb@oeis.rb:58 (lambda)>>

irb(main):006:0> seq.take(10)
=> [1, 2, 6, 12, 60, 60, 420, 840, 2520, 2520]

irb(main):007:0> seq.take(10)
=> [27720, 27720, 360360, 360360, 360360, 720720, 12252240, 12252240, 232792560, 232792560]

irb(main):008:0> seq.take(10)
=> [232792560, 232792560, 5354228880, 5354228880, 26771144400, 26771144400, 80313433200, 80313433200, 2329089562800, 2329089562800]

irb(main):009:0> OEIS::A006928.first(10000).map{|i|i-1.5}.inject(&:+)
=> 4.0

irb(main):010:0> OEIS::A006928.first(1000000).map{|i|i-1.5}.inject(&:+)
=> 14.0
```
