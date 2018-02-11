require_relative 'custom_errors'
require 'pry'

class LogFileParser
  attr_reader :log_file_path, :parsed_results

  def initialize(log_file_path)
    @log_file_path = log_file_path
    validate_file_path
    @parsed_results = Hash.new { |hash, key| hash[key] = [] }
  end

  def parse
    parse_file
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

  def parse_file
    file = IO.readlines(log_file_path)
    file.each do |line|
      path, ip = line.split
      parsed_results[path] << ip
    end
  end

  def validate_file_path
    raise LogFileNotFound if log_file_path.nil? || !File.exist?(log_file_path)
  end
end
