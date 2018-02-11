require_relative 'log_file_parser'
require_relative 'formatter/total_visit'
require_relative 'formatter/unique_visit'
require_relative 'outputter'

class PageViews
  attr_reader :parsed_results

  def initialize(log_file_path)
    @parsed_results = LogFileParser.new(log_file_path).perform
  end

  def perform
    Outputter.new(parsed_results, formatters).perform
  end

  private

  def formatters
    [Formatter::TotalVisit, Formatter::UniqueVisit]
  end
end
