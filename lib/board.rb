class Board

  attr_accessor :boardcase

  def initialize
    @boardcase = []
    @boardcase << BoardCase.new("A1")
    @boardcase << BoardCase.new("A2")
    @boardcase << BoardCase.new("A3")
    @boardcase << BoardCase.new("B1")
    @boardcase << BoardCase.new("B2")
    @boardcase << BoardCase.new("B3")
    @boardcase << BoardCase.new("C1")
    @boardcase << BoardCase.new("C2")
    @boardcase << BoardCase.new("C3")
  end

  def change_value(boardcase,new_value)
    if @boardcase[boardcase].value == nil
    print  @boardcase[boardcase].value = new_value
    else
    puts 'la case est déjà occupée, dommage'
    end
  end

  def is_still_ongoing?
    winx_array = ["x","x","x"]
    wino_array = ["o","o","o"]
    test_array = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,5,8]]
    testing_array = []
    for y in 0..(test_array.length - 1) do
      for x in 0..2 do
        testing_array << @boardcase[test_array[y][x]].value
      end
      if testing_array == winx_array
        return true
      elsif testing_array == wino_array
        return true
      else
        testing_array.clear
      end
    end
  end  

  def board_show
    puts "+---+---+---+"
    puts "+#{if @boardcase[0].value == nil
                 print " "
                  else @boardcase[0].value
                            end} + #{@boardcase[1].value} + #{@boardcase[2].value} +"
    puts "+---+---+---+"
    puts "+ #{@boardcase[3].value} + #{@boardcase[4].value} + #{@boardcase[5].value} +"
    puts "+---+---+---+"
    puts "+ #{@boardcase[6].value} + #{@boardcase[7].value} + #{@boardcase[8].value} +"
    puts "+---+---+---+"
  end

  def board_choice
     for list_value in 0..(@boardcase.length-1) do
      puts "##{list_value} #{@boardcase[list_value].name}"
    end
  end

end