require_relative 'custom_errors'

class LogFileParser
  attr_reader :log_file_path

  def initialize(log_file_path)
    @log_file_path = log_file_path
    validate_file_path
  end

  private

  def validate_file_path
    raise LogFileNotFound if log_file_path.nil? || File.exist?(log_file_path)
  end
end
