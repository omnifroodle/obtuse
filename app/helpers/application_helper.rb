module ApplicationHelper

  def do_break(o)
    !same_source(o) || !successive_index(o)
  end

  def should_close_span(o)
    foo = !same_source(o)
    bar = !successive_index(o)
    tom = foo || bar
    tom
  end

  def in_a_row(o)
    same_source(o) && successive_index(o)
  end

  def successive_index(o)
#    binding.pry
    (@previous_index.succ == o.index)
  end

  def same_source(o)
    (o.source == @previous_source)
  end
end
