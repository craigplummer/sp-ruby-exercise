class Outputter
  attr_reader :parsed_results, :formatters

  def initialize(parsed_results, formatters)
    @parsed_results = parsed_results
    @formatters = formatters
  end

  def output
    formatters.each do |formatter|
      puts formatter.new.format(parsed_results)
      puts
    end
  end
end
