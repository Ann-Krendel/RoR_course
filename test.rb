require "./task1.rb"
require 'test/unit'
extend Test::Unit::Assertions

t1 = Train.new(1, "a", 4)
t2 = Train.new(2, "a", 3)
t3 = Train.new(3, "b", 7)
t4 = Train.new(4, "b", 8)

s1 = Station.new("Simferopol")
s2 = Station.new("Moscow")
s3 = Station.new("Spb")

s1.new_train(t1)
s1.new_train(t4)
s2.new_train(t2)
s3.new_train(t3)

assert_equal t1.get_speed(), 0
t1.speed_increase(30)
assert_equal t1.get_speed(), 30
t1.stop()
assert_equal t1.get_speed(), 0

assert_equal t1.get_size, 4
assert_equal t1.size_increase, 5
t1.speed_increase(30)
assert_equal t1.size_increase, 5
t1.stop
assert_equal t1.size_increase, 6


assert_equal s1.count_trains_by_type("a"), 1
assert_equal s2.count_trains_by_type("a"), 1
assert_equal s3.count_trains_by_type("a"), 0
assert_equal s1.count_trains_by_type("b"), 1
assert_equal s2.count_trains_by_type("b"), 0
assert_equal s3.count_trains_by_type("b"), 1

r1 = Route.new(s3, s1)
r1.add_station(s2)
assert_equal r1.get_list_stations.length, 3

assert_equal t1.get_station, s1
t1.post_route(r1)
assert_equal t1.get_station, s3
assert_equal s1.count_trains_by_type("a"), 0
assert_equal s3.count_trains_by_type("a"), 1


t1.go_forward
assert_equal t1.get_station, s2
assert_equal s2.count_trains_by_type("a"), 2
assert_equal s3.count_trains_by_type("a"), 0

t1.go_forward
assert_equal t1.get_station, s1
assert_equal s2.count_trains_by_type("a"), 1
assert_equal s1.count_trains_by_type("a"), 1

t1.go_forward
assert_equal t1.get_station, s1