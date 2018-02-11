require_relative 'log_file_parser'
require_relative 'formatter/total_visit'

class PageViews
  attr_reader :parsed_results

  def initialize(log_file_path)
    @parsed_results = LogFileParser.new(log_file_path).parse
  end

  def display
    display_total_visits
    display_unique_visits
  end

  private

  def display_total_visits
    Formatter::TotalVisit.new.format(parsed_results)
  end

  def display_unique_visits
    puts 'Unique page views:'
    unique_visits.map  do |path, views|
      puts "#{path} #{views.uniq.count} unique views"
    end
  end

  def unique_visits
    parsed_results.sort_by { |_path, ips| -ips.uniq.count }
  end
end
