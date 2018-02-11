module Formatter
  class Base
    def format(parsed_results)
      visits(parsed_results).map do |path, views|
        sprintf("%-#{path_padding(parsed_results)}s %d %s", path, views_count(views), description)
      end.join("\n").prepend(header)
    end

    def path_padding(parsed_results)
      parsed_results.keys.map(&:length).max + 5
    end
  end
end
