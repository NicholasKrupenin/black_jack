class User

  attr_reader :deck, :deck_hidden, :dealer_deck
  attr_accessor :bank

  def initialize
    @deck = []
    @deck_hidden = []
    @dealer_deck = []
    @bank = 100
  end

  def card_distribution(number, obj)
    (number).times { @deck << obj.card_take }
  end

  def card_view(arg)
    s = ""
    arg.each do |a, _b|
     s << "(" + a.ljust(2) + _b.to_s + ")"
    end
    s
  end

  def rates
    @bank -= 10
  end

  def win
    @bank += 20
  end

  def have_money?
    @bank <= 0
  end

end

class Dealer < User

  def card_distribution(number, obj)
    (number).times { @dealer_deck << obj.card_take }
    (number).times { @deck_hidden << "*" }
  end

end
