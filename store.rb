class Card

  attr_reader :card

  SUITS_SYMBOLS = %w("\u2660", "\u2665", "\u2666", "\u2663", "\u2664", "\u2661", "\u2662", "\u2667")

  SUITS_PICTURE = %w("King", "Queen", "Jack", "Ace")

  def initialize
   @card= [SUITS_SYMBOLS.sample, rand(2..10), SUITS_PICTURE.sample]
   yield @card if block_given?
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



