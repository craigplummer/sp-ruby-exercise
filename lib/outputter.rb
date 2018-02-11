class Outputter
  attr_reader :parsed_results, :formatters

  def initialize(parsed_results, formatters)
    @parsed_results = parsed_results
    @formatters = formatters
  end

  def output
    formatters.each do |formatter|
      puts formatter.new(padding).format(parsed_results)
      puts
    end
  end

  private

  def padding
    parsed_results.keys.map(&:length).max + 5
  end
end
