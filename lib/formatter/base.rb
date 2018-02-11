module Formatter
  class Base
    def format(parsed_results)
      puts header
      visits(parsed_results).map do |path, views|
        puts "#{path} #{views_count(views)} #{description}"
      end
    end
  end
end
