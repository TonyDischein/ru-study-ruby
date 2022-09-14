module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        films = array.reject { |film| country_nill?(film) }.select { |film| more_two_country?(film) && rating_kinopoisk_positiv?(film) }
        films_rating = films.map { |film| only_rating(film) }
        films_rating.reduce { |sum, item| sum + item } / films.count
      end

      def chars_count(films, threshold)
        films = films.select { |film| check_by_rating_and_char?(film, threshold, 'и') }.map { |film| get_char_count(film, 'и') }
        films.reduce { |sum, item| sum + item }
      end

      private

      def check_by_rating_and_char?(film, threshold, char)
        film['rating_kinopoisk'].to_f >= threshold && film['name'].count(char).positive?
      end

      def get_char_count(film, char)
        film['name'].count(char)
      end

      def more_two_country?(film)
        film['country'].split(',').size >= 2
      end

      def rating_kinopoisk_positiv?(film)
        film['rating_kinopoisk'].to_f.positive?
      end

      def only_rating(film)
        film['rating_kinopoisk'].to_f
      end

      def country_nill?(film)
        film['country'].nil?
      end
    end
  end
end
