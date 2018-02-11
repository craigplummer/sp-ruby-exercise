require_relative 'base'

module Formatter
  class TotalVisit < Base
    private

    def visits(parsed_results)
      parsed_results.sort_by { |_path, ips| -ips.count }
    end

    def views_count(views)
      views.count
    end

    def description
      'visits'
    end

    def header
      "Total page views:\n"
    end
  end
end
