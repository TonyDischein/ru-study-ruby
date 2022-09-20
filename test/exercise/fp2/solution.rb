module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(item = 0, &func)
        unless self[item].nil?
          func.call self[item]
          my_each(item + 1, &func)
        end
        self
      end

      # Написать свою функцию my_map
      def my_map
        my_reduce(self.class.new) { |acc, current| acc << yield(current) }
      end

      # Написать свою функцию my_compact
      def my_compact
        reduce(self.class.new) { |acc, current| current.nil? ? acc : acc << current }
      end

      # Написать свою функцию my_reduce
      def my_reduce(*args, &func)
        if args.count.zero?
          acc = self[0]
          col = slice(1..length)
        else
          acc, col = args
          col = self if col.nil?
        end

        head, *tail = col
        return acc if head.nil?

        my_reduce(func.call(acc, head), tail, &func)
      end
    end
  end
end
