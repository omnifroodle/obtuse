class Markov

  attr_accessor :word_hash

  def initialize(strs)
    @word_hash = Hash.new{|h, k| h[k] = []}
    strs = Array(strs)
    words = strs.flatten.join(" ")

    words = words.gsub(/[\.\?\(\)\[\]\,\-`"]/, " ")
    words = words.split
    words = words.map(&:downcase)
    len = words.count - 1
    words.each_with_index do |word, index|
      if index < len
        word_hash[word] << words[index + 1]
      end

    end
  end

  def random_word
    count = word_hash.count
    idx = rand(count)
    z = word_hash.to_a
    z[idx].first
  end

  def gimme(num)
    result = []
    previous_word = random_word
    result << previous_word
    1.upto(num) do
      bag = word_hash[previous_word]
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
    result.join(' ')
  end

end
