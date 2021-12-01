# frozen_string_literal: true

class Proc
  def right_curry
    return call if arity.zero?

    Array.new.then do |arguments|
      ->(first) { call(first, *arguments.slice(1..)) }
        .then { |inner| [inner, *(1...arity).to_a] }
        .reduce(&method(:reduce_curry).curry[arguments])
    end
  end

  def reduce_curry(arguments, memo, index)
    lambda do |next_argument|
      arguments[index] = next_argument

      memo
    end
  end
end

class Method
  def right_curry
    to_proc.right_curry
  end
end
