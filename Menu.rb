module Menu
  def add_menu
    @menu.add_constanta(App::MENU)
  end

  def start
    add_menu
    loop do
      show_menu
      choice = get_choice
      take_start(choice)
    end
  end

  def show_menu
    @menu.list.each_with_index do |value|
      puts "#{value[:id]}. #{value[:title]}"
    end
  end

  def get_choice
    gets.to_i
  end

  def take_start(choice)
   start = @menu.find_by(:id, choice)
   send start[:action]
  end
end