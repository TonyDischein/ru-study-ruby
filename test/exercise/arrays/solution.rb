module Exercise
  module Arrays
    class << self
      def replace(array)
        max_value = array.reduce { |max, current| max < current ? current : max }

        array.map { |item| item.positive? ? max_value : item }
      end

      def search(array, query, left = 0, right = nil)
        right = get_right(array, right)
        return -1 if end?(left, right)

        mid = get_mid(left, right)
        unless query?(array, mid, query)
          left, right = update_range(array, query, mid, left, right)
          return search(array, query, left, right)
        end
        mid
      end

      private

      def update_range(array, query, mid, left, right)
        if array[mid] < query
          left = mid + 1
        else
          right = mid - 1
        end
        [left, right]
      end

      def get_right(array, right)
        right = array.size - 1 if right.nil?
        right
      end

      def query?(array, mid, query)
        array[mid] == query
      end

      def end?(left, right)
        left > right
      end

      def get_mid(left, right)
        (left + ((right - left) / 2)).to_i
      end
    end
  end
end
