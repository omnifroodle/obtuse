require 'ostruct'
class Markov

  attr_accessor :word_hash


  def srcs
    d = File.expand_path File.dirname(__FILE__)
    {

#      :bjork => File.readlines(File.join(d, 'bjork.txt')),
      :herzog => File.readlines(File.join(d, 'herzog.txt')),
      :oblique_strategies => File.readlines(File.join(d, 'oblique_strategies.txt')),
      :rams => File.readlines(File.join(d, "rams.txt")),
      :random_design => File.readlines(File.join(d, "random_design.txt")),
      :sagmeister => File.readlines(File.join(d, "sagmeister.txt"))
    }
  end

  def initialize
    @word_hash = Hash.new{|h, k| h[k] = []}
    srcs.each do |k, v|
      puts k
      strs = v
      strs = Array(strs)
      words = strs.flatten.join(" ")
      words = words.gsub(/[\.\?\(\)\[\]\,\-`"]/, " ")
      words = words.split
      words = words.map(&:downcase)
      len = words.count - 1
      words.each_with_index do |word, index|
        if index < len
          foo = OpenStruct.new({:text => words[index + 1], :source => k})
          word_hash[word] << foo
        end
      end
    end
  end

  def random_word
    count = word_hash.count
    idx = rand(count)
    z = word_hash.to_a
    z[idx].last.first
  end

  def gimme(num)
    result = []
    previous_word = random_word
    result << previous_word
    1.upto(num) do
      bag = word_hash[previous_word.text]
      #      print "Previous Word: #{previous_word} ", "Bag: #{bag.inspect}","\n"
      len = bag.count
      idx = rand(len)
      next_word = bag[idx]
      if next_word.nil?
        next_word = random_word
      end
      result << next_word
      previous_word = next_word
    end
    result
  end

end
