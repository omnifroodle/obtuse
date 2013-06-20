class QuotesController < ApplicationController

  def index
    size = rand(4) + 4
    @quote = Markov.new.gimme(size)
    @save_quote = {}
      @quote.each_with_index{|x, idx| @save_quote[idx] = {:text => x.text, :source => x.source, :index => x.index} }
    @previous_source = @quote.first.source
    @previous_index = @quote.first.index
  end

  def show
    @quote = Witticism.find(params[:id]).quote
    @quote = @quote.map{|x| OpenStruct.new(x.last)}
    @previous_source = @quote.first.source
    @previous_index = @quote.first.index

  end


end
