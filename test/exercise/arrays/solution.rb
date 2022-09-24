module Exercise
  module Arrays
    class << self
      def replace(array)
        max_value = 0

        array.each { |item| max_value = item if max_value < item } \
             .map { |item| item.positive? ? max_value : item }
      end

      def search(array, query, left = 0, right = array.size - 1)
        return -1 if array.empty? ||  query < array[0] || query > array[right]

        mid = (left + ((right - left) / 2)).to_i
        return mid if array[mid] == query

        left, right = array[mid] < query ? [mid + 1, right] : [left, mid - 1]
        search(array, query, left, right)
      end
    end
  end
end
