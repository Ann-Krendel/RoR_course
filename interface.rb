require "./train.rb"
require "./station.rb"
require "./route.rb"
require 'test/unit'
require "./cargotrain.rb"
require "./passengertrain.rb"
require "./cargo_van.rb"
require "./passenger_van.rb"

class Interface

  attr_reader :stations, :cargo_trains, :pass_trains, :routes
  def initialize()
    @stations = []
    @cargo_trains = []
    @pass_trains = []
    @routes=[]
    @main_menu="Выберите действие:
    0 - выход
    1 - Создать станцию
    2 - Создать поезд
    3 - Создать маршрут
    4 - Назначать маршрут поезду
    5 - Добавлять вагоны к поезду
    6 - Отцеплять вагоны от поезда
    7 - Перемещать поезд по маршруту вперед и назад
    8 - Просматривать список станций и список поездов на станции"
  end


  def main_page

    while true
      clear
      puts @main_menu
      num = gets.to_i
      case num
      when 0
        clear
        return
      when 1
        clear
        puts "Отлично, выбрана команда " + num.to_s + ")" + "Создать станцию"
        create_station
      when 2
        clear
        puts "Отлично, выбрана команда " + num.to_s + ")" + "Создать поезд"
        create_train
      when 3
        clear
        puts "Отлично, выбрана команда " + num.to_s + ")" + "Создать маршрут"
        create_route
      when 4
        clear
        puts "Отлично, выбрана команда " + num.to_s + ")" + "Назначать маршрут поезду"
        route_for_train
      when 5
        clear
        puts "Отлично, выбрана команда " + num.to_s + ")" + "Добавлять вагоны к поезду"
        add_vans
      when 6
        clear
        puts "Отлично, выбрана команда " + num.to_s + ")" + "Отцеплять вагоны от поезда"
        del_vans
      when 7
        clear
        puts "Отлично, выбрана команда " + num.to_s + ")" + " Перемещать поезд по маршруту вперед и назад"
        train_move
      when 8
        clear
        puts "Отлично, выбрана команда " + num.to_s + ")" + " Просматривать список станций и список поездов на станции"
        station_train_list
      end
    end
  end


  private


  def create_station
    puts "Выберите действие:\n0 - выход\n1 - продолжить"
    s_mod = gets.to_i
    puts "\n"
    if s_mod == 0
      return
    end
    puts "Введите название станции:"
    name = gets.to_s
    puts "\n"
    station = Station.new(name)
    @stations << station
    create_station
  end


  def create_train
    puts "Выберите действие:\n0 - выход\n1 - продолжить"
    train_mod = gets.to_i
    puts "\n"
    if train_mod == 0
      return
    end
    puts "Выберите тип поезда:
    1) cargo - Грузовой
    2) passenger - Пассажирский"
    type = gets.to_i
    puts "\n"
    case type
    when 1
      puts "Введите номер грузового поезда"
      num_cargo = gets.to_i
      puts "\n"
      cargo_train = CargoTrain.new(num_cargo)
      @cargo_trains << cargo_train
    when 2
      puts "Введите номер пассажирского поезда"
      num_pass = gets.to_i
      puts "\n"
      pass_train = PassengerTrain.new(num_pass)
      @pass_trains << pass_train
    end
    create_train
  end


  def create_route
    puts "Выберите действие:\n0 - выход\n1 - продолжить"
    route_mod = gets.to_i
    puts "\n"
    if route_mod == 0
      return
    end
    puts "Введите название маршрута:"
    r_name = gets.to_s
    puts "\nВыберите первую станцию маршрута:"
    for i in 0...@stations.size do
      puts i.to_s + ")" + @stations[i].name.to_s
    end
    first_station = gets.to_i
    puts "\nВыберите последнюю станцию маршрута:"
    for i in 0...@stations.size do
      puts i.to_s + ")" + @stations[i].name.to_s
    end
    last_station = gets.to_i
    route = Route.new(@stations[first_station], @stations[last_station], r_name)
    @routes << route
    while true
      puts "Выберите действие:
      0 - выход
      1 - добавить станцию в маршрут
      2 - удалить станцию из маршрута"
      mod = gets.to_i
      case mod
      when 0
        return
      when 1
        puts "\nВведите название станции:"
        for i in 0...@stations.size do
          puts i.to_s + ")" + @stations[i].name.to_s
        end
        st_num = gets.to_i
        @routes[-1].add_station(@stations[st_num])
      when 2
        puts "\nВыберите санцию"
        for i in 0...route.list_stations.size do
          puts i.to_s + ")" + route.list_stations[i].name.to_s
        end
        name_s = gets.to_i
        @routes[-1].delete_station(route.list_stations[name_s])
      end
    end
    puts "\n"
    create_route
  end


  def route_for_train
    puts "Выберите действие:\n0 - выход\n1 - продолжить"
    input = gets.to_i
    if input == 0
      return
    end
    puts "\nВыберите маршрут"
    for i in 0...@routes.size do
      puts i.to_s + ")" + @routes[i].route_name.to_s
    end
    num_route = gets.to_i
    puts "\nВыберите тип поезда:
    1) cargo - Грузовой
    2) passenger - Пассажирский"
    type = gets.to_i
    case type
    when 1
      puts "\nВведите номер грузового поезда"
      for i in 0...@cargo_trains.size do
        puts i.to_s + ")" + @cargo_trains[i].number.to_s
      end
      num_cargo = gets.to_i
      @cargo_trains[num_cargo].add_route(@routes[num_route])
    when 2
      puts "\nВведите номер пассажирского поезда"
      for i in 0...@pass_trains.size do
        puts i.to_s + ")" + @pass_trains[i].number.to_s
      end
      num_pass = gets.to_i
      @pass_trains[num_pass].add_route(@routes[num_route])
    end
    puts "\n"
    route_for_train
  end


  def add_vans
    puts "Выберите действие:\n0 - выход\n1 - продолжить"
    van_mod = gets.to_i
    if van_mod == 0
      return
    end
    puts "\nВыберите тип вагона:
    1) cargo - Грузовой
    2) passenger - Пассажирский"
    type_van = gets.to_i
    case type_van
    when 1
      puts "\nВведите номер грузового поезда"
      for i in 0...@cargo_trains.size do
        puts i.to_s + ")" + @cargo_trains[i].number.to_s
      end
      num_cargo = gets.to_i
      puts "\nВведите номер грузового вагона"
      number_van = gets.to_i
      cargo_van = CargoVan.new(number_van)
      @cargo_trains[num_cargo].add_van(cargo_van)
    when 2
      puts "\nВведите номер пассажирского поезда"
      for i in 0...@pass_trains.size do
        puts i.to_s + ")" + @pass_trains[i].number.to_s
      end
      num_pass = gets.to_i
      puts "\nВведите номер вагона"
      number_van = gets.to_i
      pass_van = PassengerVan.new(number_van)
      @pass_trains[num_pass].add_van(pass_van)
    end
    puts "\n"
    add_vans
  end


  def del_vans
    puts "Выберите действие:\n0 - выход\n1 - продолжить"
    van_mod = gets.to_i
    if van_mod == 0
      return
    end
    puts "\nВыберите тип поезда:
    1) cargo - Грузовой
    2) passenger - Пассажирский"
    type = gets.to_i
    case type
    when 1
      puts "\nВведите номер грузового поезда"
      for i in 0...@cargo_trains.size do
        puts i.to_s + ")" + @cargo_trains[i].number.to_s
      end
      num_cargo = gets.to_i
      puts "\nВыберите номер вагона"
      for j in 0...@cargo_trains[num_cargo].list_cargo_vans.size do
        puts j.to_s + ")" + @cargo_trains[num_cargo].list_cargo_vans[j].number_cargo_van.to_s
      end
      num_cargo_van = gets.to_i
      @cargo_trains[num_cargo].del_van(@cargo_trains[num_cargo].list_cargo_vans[num_cargo_van])
    when 2
      puts "\nВведите номер пассажирского поезда"
      for i in 0...@pass_trains.size do
        puts i.to_s + ")" + @pass_trains[i].number.to_s
      end
      num_pass = gets.to_i
      puts "\nВыберите номер вагона"
      for j in 0...@pass_trains[num_pass].list_pass_vans.size do
        puts j.to_s + ")" + @pass_trains[num_pass].list_pass_vans[j].number_pass_van.to_s
      end
      num_pass_van = gets.to_i
      @pass_trains[num_pass].del_van(@pass_trains[num_pass].list_cargo_vans[num_pass_van])
    end
    puts "\n"
    del_vans
  end


  def train_move
    puts "Выберите действие:
    0 - выход
    1 - переместить поезд"
    route_mod = gets.to_i
    if route_mod == 0
      return
    end
    puts "\nВыберите тип поезда:
    1) cargo - Грузовой
    2) passenger - Пассажирский"
    type = gets.to_i
    case type
    when 1
      puts "\nВведите номер грузового поезда"
      for i in 0...@cargo_trains.size do
        puts i.to_s + ")" + @cargo_trains[i].number.to_s
      end
      num_cargo = gets.to_i
      puts "\nВыберите действие:
      0 - выход
      1 - переместить поезд на предыдущую станцию
      2 - переместить поезд на следуюшую станцию"
      n = gets.to_i
      while n != 0 do
        case n
        when 1
          @cargo_trains[num_cargo].go_back
        when 2
          @cargo_trains[num_cargo].go_forward
        end
        puts "\nСейчас поезд на станции " + @cargo_trains[num_cargo].station.name.to_s + "\nВыберите действие:
        0 - выход
        1 - переместить поезд на предыдущую станцию
        2 - переместить поезд на следуюшую станцию"
        n = gets.to_i
      end
    when 2
      puts "\nВведите номер пассажирского поезда"
      for i in 0...@pass_trains.size do
        puts i.to_s + ")" + @pass_trains[i].number.to_s
      end
      num_pass = gets.to_i
      puts "Выберите действие:
      0 - выход
      1 - переместить поезд на предыдущую станцию
      2 - переместить поезд на следуюшую станцию"
      n = gets.to_i
      while n != 0 do
        case n
        when 1
          @pass_trains[num_pass].go_back
        when 2
          @pass_trains[num_pass].go_forward
        end
        puts "\nСейчас поезд на станции " + @pass_trains[num_pass].station.name.to_s + "\nВыберите действие:
        0 - выход
        1 - переместить поезд на предыдущую станцию
        2 - переместить поезд на следуюшую станцию"
        n = gets.to_i
      end
    end
    puts "\n"
  end


  def station_train_list
    puts "Выберите действие:
    0 - выход
    1 - вывести список станций
    2 - вывести список поездов конкретной станции"
    list_mod = gets.to_i
    case list_mod
    when 0
      return
    when 1
      puts "\n"
      for i in 0...@stations.size do
        puts i.to_s + ")" + @stations[i].name.to_s
      end
    when 2
      puts "\nВыберите станцию"
      for i in 0...@stations.size do
        puts i.to_s + ")" + @stations[i].name.to_s
      end
      while true
        input = gets.to_i
        puts "\nВыберите действие:
        0 - выход
        1 - вывести список всех поездов на станции
        2 - вывести список грузовых поездов на станции
        3 - вывести список пассажирских поездов на станции"
        train_type = gets.to_i
        case train_type
        when 0
          return
        when 1
          puts @stations[input].cargo_trains + @stations[input].pass_trains
        when 2
          puts @stations[input].cargo_trains
        when 3
          puts @stations[input].pass_trains
        end
      end
    end
    puts "\n"
    station_train_list
  end

  def clear
    system("clear") || system("cls")
  end

end