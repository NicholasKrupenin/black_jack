class Card

  attr_reader :card_classic,:card_picture, :card_hidden

  SUITS_SYMBOLS = %w("\u2660", "\u2665", "\u2666", "\u2663", "\u2664", "\u2661", "\u2662", "\u2667")

  SUITS_PICTURE = %w("King", "Queen", "Jack", "Ace")

  NUM = rand(2..10)

  def initialize
   @card_picture = [SUITS_PICTURE.sample, SUITS_SYMBOLS.sample]
   @card_classic = [SUITS_SYMBOLS.sample, NUM]
   @card_hidden = ["*"]
  end
end


 cat = <<~CAT
  _ _/|
 \'o.0'
 =(___)=
    U
 CAT

 duck = <<~DUCK
       ,~~.
     (  9 )-_,
(\___ )=='-'
 \ .   ) )
  \ `-' /
   `~j-'
     "=:
     DUCK

crab = <<~CRAB

   / <`     '> \
  (  / @   @ \  )
   \(_ _\_/_ _)/
 (\ `-/     \-' /)
  "===\     /==="
   .==')___(`==.
  ' .='     `=.
  CRAB



