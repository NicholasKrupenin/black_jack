    case @calculate.summ(@user.deck) <=> @calculate.summ(@dealer.dealer_deck)
    when -1 then puts "\n #{name}, you lose"
    when 0 then puts "\n #{name}, it's draw"
    when 1 then puts "\n #{name}, you win"


class Calculate

  attr_reader :result

  def summ(obj)
    obj.inject(0) { |result, i|  result + send(:analize, i) }
  end

  def analize(arg)
    return -30 if arg.one? { |x| x.size == 3 }
    return 10 if arg.one? { |x| x.size > 3 }
    arg.inject(0) { |s, x| s + x.to_i }
  end

end
