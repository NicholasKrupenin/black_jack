class Card

  attr_reader :card

  def initialize
    @card = []
    ["\u2660", "\u2665", "\u2666", "\u2663"].each do |x|
      ["King", "Queen", "Jack", "Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10"].each do |y|
        @card.push([x, y])
      end
    end
    @card.shuffle!
  end

  def card_take
    @card.pop
  end

end



