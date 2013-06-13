class QuotesController < ApplicationController

  def index
    @quote = Markov.new.gimme(6)
  end

end
