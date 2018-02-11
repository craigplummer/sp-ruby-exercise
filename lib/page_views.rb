require_relative 'log_file_parser'

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
    puts 'Total page views:'
    total_visits.map do |path, views|
      puts "#{path} #{views.count} visits"
    end
    puts
  end

  def display_unique_visits
    puts 'Unique page views:'
    unique_visits.map  do |path, views|
      puts "#{path} #{views.uniq.count} unique views"
    end
  end

  def total_visits
    parsed_results.sort_by { |_path, ips| -ips.count }
  end

  def unique_visits
    parsed_results.sort_by { |_path, ips| -ips.uniq.count }
  end
end
