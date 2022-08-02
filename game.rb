require_relative 'card'
require_relative 'calculate'
require_relative 'user'

class Game
  attr_reader :name

  def initialize
    @card = Card.new
    @calculate = Calculate.new
    @user = User.new
    @dealer = Dealer.new
    puts "\nWelcome to BlackJack"
    print 'What is your name? ~ > '
    @name = gets.chomp
    start
  end

  def start
    send(:no_money) if @user.have_money? || @dealer.have_money?

    puts "\n Ok lets go to the game: dealer deals cards"
    @user.deck.clear
    @dealer.deck_hidden.clear
    @dealer.dealer_deck.clear

    dealt_card

    puts "\n rates 10$"
    @user.rates
    @dealer.rates
    game
  end

  def game
    view_hidden
    print "\nWhat next? 1: open, 2: add, 3: skip, 4: cash status, Any symbol: exit = "
    selected = gets.to_i

    case selected
    when 1 then send(:open)
    when 2 then send(:add_cart)
    when 3 then send(:skip)
    when 4 then send(:cash_status)
    else
      exit
    end
  end

  def dealt_card(number = 2)
    puts "\n Cards are dealt"
    sleep(0.5)
    @user.card_distribution(number, @card)
    @dealer.card_distribution(number, @card)
  end

  def open
    puts "\n> #{@name} card: #{@user.card_view(@user.deck)} points: #{@calculate.summ(@user.deck)}"
    puts "> Dealer card: #{@dealer.card_view(@dealer.dealer_deck)} points: #{@calculate.summ(@dealer.dealer_deck)}"
    who_won
  end

  def view_hidden
    puts "\n> #{@name} card: #{@user.card_view(@user.deck)} points: #{@calculate.summ(@user.deck)}"
    puts "> Dealer card: #{@dealer.card_view(@dealer.deck_hidden)} points: **"
  end

  def add_cart
    @user.card_distribution(1, @card) if @user.deck.size < 3
    skip
  end

  def skip
    @dealer.card_distribution(1, @card) if @calculate.summ(@dealer.dealer_deck) < 17
    card_max?
    next_step
  end

  def card_max?
    @user.deck.size == 3 && @dealer.dealer_deck.size == 3
  end

  def next_step
    card_max? ? send(:open) : send(:game)
  end

  def cash_status
    puts "\n#{name} : #{@user.bank}$"
    puts "Dealer  : #{@dealer.bank}$"
    game
  end

  def no_money
    puts "\nNo money to continue the game"
    exit
  end

  def who_won
    if @calculate.summ(@user.deck) <= 21 && @calculate.summ(@dealer.dealer_deck) <= 21
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
    end_game
  end

  def end_game
    print "\nWhat next? 1: rematch, Any symbol: exit = "
    selected = gets.to_i
    case selected
    when 1 then send(:start)
    when 2 then send(:start)
    else
      exit
    end
  end
end

Game.new
