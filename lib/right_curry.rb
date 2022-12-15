# frozen_string_literal: true

module RightCurry
  Proc.class_eval do
    def right_curry
      return call if arity.zero?

      Hash.new.then do |arguments|
        ->(first) { call(first, *arguments.values.reverse) }
          .then { |rightmost| [rightmost, *(1...arity)] }
          .reduce do |memo, index|
            lambda do |next_argument|
              arguments.merge!(index => next_argument) and return memo
            end
          end
      end
    end
  end

  Method.class_eval do
    def right_curry
      to_proc.right_curry
    end
  end
end
