require_relative 'markov.rb'

d = File.expand_path File.dirname(__FILE__)

strategies_array = File.readlines(File.join(d, 'oblique_strategies.txt'))
herzog_array = File.readlines(File.join(d, 'herzog.txt'))
bjork_array = File.readlines(File.join(d, 'bjork.txt'))

puts "ENO"
s = Markov.new(strategies_array)
10.times do
  print "\t", s.gimme(6), "\n"
end
puts "", "Herzog"
h = Markov.new(herzog_array)
10.times do
  print "\t", h.gimme(6), "\n"
end
puts "", "Bjork"
bj = Markov.new(bjork_array)
10.times do
  print "\t", bj.gimme(6), "\n"
end

puts "", "Eno + Herzog + bjork"
hs = Markov.new(strategies_array | herzog_array | bjork_array)
10.times do
  print "\t\t\t", hs.gimme(6), "\n"
end

puts "", "Eno + Herzog"
hs = Markov.new(strategies_array | herzog_array )
10.times do
  print "\t\t", hs.gimme(6), "\n"
end
