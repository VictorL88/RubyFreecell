$gtk.reset

def tick args
  if args.state.cards.nil?
    create_deck args
  end
  draw args
  #test
  args.state.cards[1].x=600

end

def draw args
  
  args.state.cards.each do |elem|
    args.outputs.sprites << [elem.x, 200, 100, 100, elem.sprite, 0, 255]
  endº
end

def create_deck args
  args.state.cards ||= []
  args.state.card_list ||= args.gtk.read_file '_cards.csv'
  args.state.cards+= args.state.card_list.each_line.map do|l,i|
    puts i
    args.state.new_entity :card, x: 0, y:0, sprite:"/sprites/" + l.strip + ".png"
  end
  args.state.cards.shuffle!
  args.state.card_list= nil
end