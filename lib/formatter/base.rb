module Formatter
  class Base
    attr_reader :padding

    def initialize(padding)
      @padding = padding
    end

    def format(parsed_results)
      visits(parsed_results).map do |path, views|
        sprintf("%-#{padding}s %d %s", path, views_count(views), description)
      end.join("\n").prepend(header)
    end
  end
end
