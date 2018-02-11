require_relative 'custom_errors'

class LogFileParser
  attr_reader :log_file_path, :parsed_results

  def initialize(log_file_path)
    @log_file_path = log_file_path
    validate_file_path
    @parsed_results = Hash.new { |hash, key| hash[key] = [] }
  end

  def parse
    parse_file
    parsed_results
  end

  private

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
