module Exercise
  module Arrays
    class << self
      def replace(array)
        max_value = 0

        array.each { |item| max_value = item if max_value < item } \
             .map { |item| item.positive? ? max_value : item }
      end

      def search(array, query, left = 0, right = array.size - 1)
        return -1 if left > right

        mid = (left + ((right - left) / 2)).to_i
        if array[mid] != query
          left, right = array[mid] < query ? [mid + 1, right] : [left, mid - 1]
          return search(array, query, left, right)
        end
        mid
      end
    end
  end
end
