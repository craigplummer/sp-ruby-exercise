require_relative 'log_file_parser'
require_relative 'formatter/total_visit'
require_relative 'formatter/unique_visit'

class PageViews
  attr_reader :parsed_results

  def initialize(log_file_path)
    @parsed_results = LogFileParser.new(log_file_path).parse
  end

  def display
    puts display_total_visits
    puts
    puts display_unique_visits
  end

  private

  def display_total_visits
    Formatter::TotalVisit.new.format(parsed_results)
  end

  def display_unique_visits
    Formatter::UniqueVisit.new.format(parsed_results)
  end
end
