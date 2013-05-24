require_relative 'markov.rb'

d = File.expand_path File.dirname(__FILE__)

strategies_array = File.readlines(File.join(d, 'oblique_strategies.txt'))
herzog_array = File.readlines(File.join(d, 'herzog.txt'))
bjork_array = File.readlines(File.join(d, 'bjork.txt'))
random_design_array = File.readlines(File.join(d, "random_design.txt"))
rams_array = File.readlines(File.join(d, "rams.txt"))

def do_it(label, arrays)
  puts label
  m = Markov.new(arrays)
  10.times do
    print "\t", m.gimme(6), "\n"
  end
end

def do_haiku(label, arrays)
  puts label
  m = Markov.new(arrays)
  10.times do
    print "\t", m.gimme(4), "\n"
    print "\t", m.gimme(5), "\n"
    print "\t", m.gimme(4), "\n"
puts
  end
end

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


puts "", "Dieter Rams"
dr = Markov.new(rams_array)
10.times do
  print "\t", dr.gimme(6), "\n"
end

puts "", "Random Design"
rd = Markov.new(random_design_array)
10.times do
  print "\t", rd.gimme(7), "\n"
end

# to clean http://designwashere.com/80-inspiring-quotes-about-design/
do_it("random design + rams", random_design_array | rams_array)

do_it("everything", strategies_array | herzog_array | bjork_array | random_design_array | rams_array)


do_haiku("everything", strategies_array | herzog_array | bjork_array | random_design_array | rams_array)
