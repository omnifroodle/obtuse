class QuotesController < ApplicationController

  def index
    @quote = Markov.new.gimme(6)

    @previous_source = @quote.first.source
    @previous_index = @quote.first.index
  end

end
