module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.
      FIRST = 1
      # Написать свою функцию my_each
      def my_each(arr = self, &func)
        unless arr.empty?
          yield arr.first
          my_each(arr.drop(FIRST), &func)
        end
        self
      end

      # Написать свою функцию my_map
      def my_map
        my_reduce(self.class.new) { |acc, current| acc << yield(current) }
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(self.class.new) { |acc, current| current.nil? ? acc : acc << current }
      end

      # Написать свою функцию my_reduce
      def my_reduce(accumulator = nil, &sumator)
        return accumulator if empty?

        self.class.new(drop(FIRST)).my_reduce(accumulator ? sumator.call(accumulator, first) : first, &sumator)
      end
    end
  end
end
