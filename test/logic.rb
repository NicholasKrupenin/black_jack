require_relative 'card'
require_relative 'calculate'
require_relative 'user'

class Logic

  attr_accessor :name

  def initialize
    @card, @calculate, @user, @dealer = Card.new, Calculate.new, User.new, Dealer.new
  end

  def dealt_card(number = 2)
    puts "Sorry " if number == 2 && @user.deck.size >= 2
    puts "\n Cards are dealt"
    sleep (0.5)
    @user.card_distribution(number,@card)
    @dealer.card_distribution(number,@card)
  end

  def view
    puts "\n#{@name} card: #{@user.card_view(@user.deck)} points: #{@calculate.summ(@user)}"
    puts "Dealer card: #{@dealer.card_view(@dealer.deck)} points: #{@calculate.summ(@dealer)}"
  end


  def view_hidden
    puts "\n#{@name} card: #{@user.card_view(@user.deck)} points: #{@calculate.summ(@user)}"
    puts "Dealer card: #{@dealer.card_view(@dealer.deck_hidden)} points: **"
  end

  def add_cart
    dealt_card(1) if @user.deck.size <= 3
  end

  def dealer_move
  end

  def winner

  end


end
