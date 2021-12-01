# frozen_string_literal: true

module RightCurry
  Proc.class_eval do
    def right_curry
      return call if arity.zero?

      Array.new.then do |arguments|
        ->(first) { call(first, *arguments.slice(1..)) }
          .then { |rightmost| [rightmost, *(1...arity)] }
          .reduce(&method(:reduce_curry).curry[arguments])
      end
    end

    def reduce_curry(arguments, memo, index)
      ->(next_argument) { (arguments[index] = next_argument) && memo }
    end
  end

  Method.class_eval do
    def right_curry
      to_proc.right_curry
    end
  end
end
