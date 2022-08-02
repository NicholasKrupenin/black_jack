require_relative 'card'
require_relative 'calculate'
require_relative 'user'

class Game

  attr_reader :name

  ACTION = {1 => :open, 2 => :add_cart, 3 => :skip, 4 => :cash_status, 5 => :start, 6 => :view_hidden}

  def initialize
    @card, @calculate, @user, @dealer = Card.new, Calculate.new, User.new, Dealer.new
    puts "\nWelcome to BlackJack"
    print "What is your name? ~ > "
    @name = gets.chomp
    start
    game
  end

  def start

    puts "\n Ok lets go to the game: dealer deals cards"
    @user.deck.clear
    @dealer.deck_hidden.clear
    @dealer.dealer_deck.clear

    dealt_card

    puts "\n rates 10$"
    @user.rates
    @dealer.rates

    view_hidden

   end

  def game
    loop do

      print "\n What next? 1: open, 2: add, 3: skip, 4: cash status, 5: rematch, 6: exit = "
      selected = gets.to_i
      break if selected == 7
      send(ACTION[selected])
    end
  end

  def dealt_card(number = 2)
    puts "\n Cards are dealt"
    sleep (0.5)
    @user.card_distribution(number,@card)
    @dealer.card_distribution(number,@card)
  end

  def open
    puts "\n#{@name} card: #{@user.card_view(@user.deck)} points: #{@calculate.summ(@user.deck)}"
    puts "Dealer card: #{@dealer.card_view(@dealer.dealer_deck)} points: #{@calculate.summ(@dealer.dealer_deck)}"
    who_won
  end


  def view_hidden
    puts "\n#{@name} card: #{@user.card_view(@user.deck)} points: #{@calculate.summ(@user.deck)}"
    puts "Dealer card: #{@dealer.card_view(@dealer.deck_hidden)} points: **"
  end

  def add_cart
    @user.card_distribution(1,@card) if @user.deck.size < 3
    skip
  end

  def skip
    if @calculate.summ(@dealer.dealer_deck) < 17
      @dealer.card_distribution(1,@card)
    end
  end

  def cash_status
    puts "\n#{name} : #{@user.bank}$"
    puts "Dealer  : #{@dealer.bank}$"
  end

  def who_won
    if @calculate.summ(@user.deck) <= 21 && @calculate.summ(@dealer.dealer_deck) <=21
      case @calculate.summ(@user.deck) <=> @calculate.summ(@dealer.dealer_deck)
      when -1 then puts "\n #{name}, you lose, Dealer win : #{@dealer.win}$"
      when 0
        puts "\n #{name}, it's draw"
        @user.bank = 100
        @dealer.bank = 100
      when 1 then puts "\n #{name}, you win #{@user.win}$"
      end
    elsif @calculate.summ(@user.deck) <= 21 && @calculate.summ(@dealer.dealer_deck) > 21
      puts "\n #{name}, you win #{@user.win}$"
    else
      puts "\n #{name}, you lose, Dealer win : #{@dealer.win}$"
    end
  end
end

Game.new
