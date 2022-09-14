module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        index = 0
        while index < length
          yield self[index]
          index += 1
        end
        self
      end

      # Написать свою функцию my_map
      def my_map
        results = self.class.new

        my_each do |item|
          results << yield(item)
        end

        results
      end

      # Написать свою функцию my_compact
      def my_compact
        results = self.class.new
        my_map do |item|
          results << item unless item.nil?
        end

        results
      end

      # Написать свою функцию my_reduce
      def my_reduce(*args)
        n = 0
        if args.count < 1
          init_value = self[0]
          n = 1
        else
          init_value, = args
        end
        for i in n...size
          init_value = yield init_value, self[i]
        end
        init_value
      end
    end
  end
end
