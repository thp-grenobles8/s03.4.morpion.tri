class Game

  attr_accessor :player,:board, :player_on_the_play

  def initialize(name)
    @name = name
    @board = Board.new
    @player = []
  end

  def add_player # Permet la sélection des 2 joueurs et leurs symboles
    puts "Bonjour et bienvenue dans mon super jeu de morbak !"
    puts "Au premier joueur de choisir son pseudo"
    print ">> "
    new_name = gets.chomp
    puts "Tu as même la chance de choisir le symbole avec lequel tu vas jouer : *x* ou *o*"
    symbol = nil
    while symbol != "x" && symbol != "o"
      symbol = gets.chomp
      if symbol == "x"
       puts "tu choisis le symbole x"
      elsif symbol == "o"
        puts "tu choisis le symbole o"
      else
        puts "Tu n'as pas choisi un symbole valide, try again"
      end
    end
    @player << Player.new(new_name,symbol)
    puts 'Au tour de ton adversaire de choisir son pseudo'
    print ">> "
    new_name2 = gets.chomp
    if symbol == "x"
      puts "Tu auras le symbole o"
      symbol2 = "o"
    else
      puts "Tu auras le symbole x"
      symbol2 = "x"
    end
    @player << Player.new(new_name2,symbol2)
    puts "Le joueur #{new_name} a été ajouté à la partie avec le symbole #{symbol}"
    puts "Le joueur #{new_name2} a été ajouté à la partie avec le symbole #{symbol2}"
  end

  def who_begins? # Permet de tirer aléatoirement le joueur qui va commencer avec un jet de dé.
    rand1 = dice_roll
    rand2 = dice_roll
    puts "#{@player[0].name} lance un dé, il obtient #{rand1} !"
    puts "#{@player[1].name} lance un dé, il obtient #{rand2} !"
    if rand1 > rand2
      puts "#{@player[0].name} commence"
      @player_on_the_play = @player[0]
    elsif rand1 == rand2
      puts "Egalité, mais vu que #{@player[0].name} a choisi le symbole c'est #{@player[1].name} qui commence"
      @player_on_the_play = @player[1]
    else
      puts "#{@player[1].name} commence"
      @player_on_the_play = @player[1]
    end
  end


  def play_turn # Boucle qui va se répeter pour remplir le damier à chaque tour de jeu
    board.board_show
    boardcase_user = nil
    puts "C'est au tour de #{@player_on_the_play.name} de jouer"
    puts "Quelle action veux-tu faire ?"
    board.board_choice
    while boardcase_user != "0" && boardcase_user != "1" && boardcase_user != "2" && boardcase_user != "3" && boardcase_user != "4" && boardcase_user != "5" && boardcase_user != "6" && boardcase_user != "7" &&boardcase_user != "8"
    boardcase_user = gets.chomp
     if boardcase_user.count("012345678") < 1
      puts "merci de rentrer le bon chiffre"
      end
    end
    new_value = @player_on_the_play.symbol
    board.change_value(boardcase_user.to_i,new_value)
    if @player_on_the_play == @player[0]
      @player_on_the_play = @player[1]
    else
      @player_on_the_play = @player[0]
    end
  end

  def dice_roll
    return rand (1..6)
  end
  

end
