module Formatter
  class Base
    attr_reader :padding

    def initialize(padding)
      @padding = padding
    end

    def perform(parsed_results)
      visits(parsed_results).map do |path, views|
        format("%-#{padding}<path>s %<views>d %<description>s",
               path: path, views: views_count(views), description: description)
      end.join("\n").prepend(header)
    end
  end
end
