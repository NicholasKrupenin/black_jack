require_relative 'logic'
require_relative 'card'
require_relative 'calculate'
require_relative 'user'


class Game

  attr_reader :logic, :choice, :name

  def initialize
    @card, @calculate, @user, @dealer = Card.new, Calculate.new, User.new, Dealer.new
    puts "Welcome to BlackJack"
    print "What is your name? ~ > "
    @name = gets.chomp
    @choice = {1 => :dealt_card, 2 => :view_hidden, 3 => dealt_card, 4 => :view}
    start
  end

  def start

    loop do
      puts "\nOk #{@name}, enter your choice (1: dealt, 2: view, 3: add, 4: open, 5 :restart, 6: exit) ~> "
      selected = gets.to_i
      break if choice == 6
      met = @choice[selected].to_s
      send(@a
    end
  end

  def dealt_card(number = 2)
    puts "\n Cards are dealt"
    sleep (0.5)
    puts "\n Ok"
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

end

Game.new


