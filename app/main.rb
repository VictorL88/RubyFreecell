$gtk.reset
#---------------------------------------------------
def tick args
  args.state.separation ||= 40
  if args.state.cards.nil?
    create_deck args
    create_board args
  end
  draw args
end
#---------------------------------------------------
def draw args
   args.state.cards.each do |elem|
      args.outputs.sprites << [elem.x, elem.y, 100, 125, elem.sprite, 0, 255]
  end
end
#---------------------------------------------------
def create_deck args
  args.state.cards ||= []
  args.state.card_list ||= args.gtk.read_file '_cards.csv'
  args.state.card_list.each_line.each_with_index do|l,i|
    suit = nil
    case i 
    when 1..12
      suit = 1
    when 13..25
      suit = 2
    when 26..38
      suite = 3
    when 39..51
      suit = 4
    end
    args.state.cards << args.state.new_entity(:card, x: 0, y:0, sprite:"/sprites/" + l.strip + ".png", number:i%13, suit: suit)
  end
  args.state.cards.shuffle!
  args.state.card_list= nil
end
#---------------------------------------------------
def create_board args
  8.times do
    args.state.board << []
  end 
  args.state.cards.each_with_index do |elem,i|
    case i
    when 0..6
      args.state.board[0] << elem
      elem.x = 50
      elem.y = 500 - ((i%7) * args.state.separation)
    when 7..13
      args.state.board[1] << elem
      elem.x = 200
      elem.y = 500 - ((i%7) * args.state.separation)
    when 14..20
      args.state.board[2] << elem
      elem.x = 350
      elem.y = 500 - ((i%7)* args.state.separation)
    when 21..27
      args.state.board[3] << elem
      elem.x = 500
      elem.y = 500 - ((i%7)* args.state.separation)
    when 28..33
      args.state.board[4] << elem
      elem.x = 650
      elem.y = 500 - (((i-28)%6)* args.state.separation)
    when 34..39
      args.state.board[5] << elem
      elem.x = 800
      elem.y = 500 - (((i-28)%6)* args.state.separation)
    when 40..45
      args.state.board[6] << elem
      elem.x = 950
      elem.y = 500 - (((i-28)%6)* args.state.separation)
    when 46..51
      args.state.board[7] << elem
      elem.x = 1100
      elem.y = 500 - (((i-28)%6)* args.state.separation)
    end
  end
end