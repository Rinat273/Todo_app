require_relative 'collection'
require_relative 'menu'

class App
  include Menu

  attr_reader :menu, :tasks

  MENU = [
    {id: 1, title: "Добавить занятие", action: :add_tasks},
    {id: 2, title: "Просмотр занятия", action: :show_tasks},
    {id: 3, title: "Изменить занятия", action: :edit_tasks},
  ]

  def initialize
    @menu = Collection.new
    @tasks = Collection.new
  end

  private

  def add_tasks
    value = get_task
    @tasks.add({title: value})
  end

  def get_task
    puts 'Напишите задачу:'
    gets.chomp
  end

  def show_tasks
    puts 'Список задач:'
    @tasks.list.each_with_index do |v, i|
      puts "#{i+1}. #{v[:title]}"
    end
  end

  def edit_tasks
    show_tasks
    number = get_edit
    edit = @tasks.select(number-1)
    new_task = get_task
    edit[:title] = new_task
  end

  def get_edit
    puts 'Выберете номер задачи:'
    gets.to_i
  end
end

App.new.start