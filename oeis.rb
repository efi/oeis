require "prime"

module OEIS

def self.sequences
  constants(false).select{|c| c.to_s.match(/^A\d{6}$/)}.sort.map{|c| const_get(c)}
end

class Sequence
  include Enumerable
  def each
    @preamble.each{|e| yield e} if @preamble
    while @step
      yield @step.call
    end
  end
  def self.first n
    new.take n
  end
  private
  def primes
    Prime.lazy
  end
  def zero_to_infinity
    (0..Float::INFINITY).each.lazy
  end
end  

class InfiniteSequence < Sequence
  def to_a
    raise "Inifinite sequences cannot be converted to arrays."
  end
end

class A000007 < InfiniteSequence
  def initialize
    @preamble = [1]
    @step = lambda{ 0 }
  end
end
M0002 = A000007

class A002473 < InfiniteSequence
  def initialize
    @counter = 0
    @step = lambda do
      nil while ((Prime.prime_division(@counter += 1).map(&:first).max||0) > 7)
      @counter
    end
  end
end
M0477 = N0177 = A002473

class A003418 < InfiniteSequence
  def initialize
    @counter = 0
    @factors = Hash.new 0
    @step = lambda do 
      Prime.prime_division(@counter += 1).each{|k,v| @factors[k] = [@factors[k],v].max}
      Prime.int_from_prime_division @factors.to_a
    end
  end
end
M2638 = N1049 = A003418

class A004068 < InfiniteSequence
  def initialize
    @preamble = zero_to_infinity.map{|i| (5.0*(i**3.0)/6.0+i/6.0).to_i}
  end
end

class A004680 < InfiniteSequence
  def initialize
    @preamble = primes.map{|i| i.to_s(6).to_i}
  end
end

class A004681 < InfiniteSequence
  def initialize
    @preamble = primes.map{|i| i.to_s(7).to_i}
  end
end

class A006928 < InfiniteSequence
  def initialize
    @state = [1,2]
    @preamble = @state
    @step = lambda do
      return @state.push(@state.last).last if !(@reissue = !@reissue)
      @reissue = (@state.shift == 2)
      @state.push(-(@state.last-3)).last
    end
  end
end
M0070 = A006928

class A007318 < InfiniteSequence
  def initialize
    @row = [1]
    @state = [1]
    @step = lambda do
      @state = (@row = [0,@row,0].flatten.each_cons(2).map{|a,b|a+b}.to_a).clone if @state == []
      @state.shift
    end
  end
end
M0082 = A007318

class A085823 < Sequence
  def initialize
    @preamble = [2,3,5,7,23,37,53,73,373]
  end
end

class A266313 < InfiniteSequence
  def initialize
    @preamble = [0,1,2,3,4,3,2,1].cycle
  end
end

end
