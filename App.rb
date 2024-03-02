require_relative 'collection'
require_relative 'menu'
require_relative 'storage'

class App
  include Menu

  attr_reader :menu, :tasks

  MENU = [
    {id: 1, title: "Добавить занятие", action: :add_tasks},
    {id: 2, title: "Просмотр занятия", action: :show_tasks},
    {id: 3, title: "Изменить занятия", action: :edit_tasks},
    {id: 4, title: "Сохранить в БД", action: :save_data},
    {id: 5, title: "Загрузить из БД", action: :load_data}
  ]

  def initialize
    @menu = Collection.new
    @tasks = Collection.new
    @menu_storage = Storage.new('menu')
    @tasks_storage = Storage.new('tasks')
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

  def save_data
    @menu_storage.save(@menu)
    @tasks_storage.save(@tasks)
    puts "Данные сохранены"
  end

  def load_data
    @menu = @menu_storage.load
    @tasks = @tasks_storage.load
    puts "Данные загружены"
  end
end

App.new.start