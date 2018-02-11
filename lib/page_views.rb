require_relative 'log_file_parser'
require_relative 'formatter/total_visit'
require_relative 'formatter/unique_visit'

class PageViews
  attr_reader :parsed_results

  def initialize(log_file_path)
    @parsed_results = LogFileParser.new(log_file_path).parse
  end

  def display
    Outputter.new(parsed_results, formatters).output
  end

  private

  def formatters
    [Formatter::TotalVisit, Formatter::UniqueVisit]
  end
end
