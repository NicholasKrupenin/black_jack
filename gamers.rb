class Gamers

  attr_reader :bank, :deck, :deck_diler, :card

  A = ["\u2660", "\u2665", "\u2666", "\u2663"]
  B = ["King", "Queen", "Jack", "Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10"]

  def initialize
    @deck = []
    @deck_diler = []
    @bank = 100
    @card = []
    shake
  end

  def shake
    A.each do |x|
      B.each do |y|
        @card.push([x, y])
      end
    end
    @card.shuffle!
  end

  def card_take
    @card.pop
  end

  def user(number)
    (number).times { @deck << card_take }
  end

  def summ(gamer)
    gamer.inject(0) { |result, i|  result + send(:analize, i) }
  end

  def analize(arg)
    return 1 if arg.one? { |x| x.size == 3 }
    return 10 if arg.one? { |x| x.size > 3 }
    arg.inject(0) { |s, x| s + x.to_i }
  end

  def diler(number, asterisk = "*")
    (number).times { @deck_diler << asterisk }
  end

end
