require_relative '../lib/log_file_parser.rb'

describe LogFileParser do
  subject { described_class.new(log_file_path).parse }

  context 'with non existing file' do
    let(:log_file_path) { '' }

    it 'should raise a missing file error' do
      expect { subject }.to raise_error(LogFileNotFound)
    end
  end

  context 'with webserver.log file' do
    let(:log_file_path) { 'webserver.log' }
    let(:expected_output) do
      <<~OUTPUT
        Total page views:
        /about/2 90 visits
        /contact 89 visits
        /index 82 visits
        /about 81 visits
        /help_page/1 80 visits
        /home 78 visits

        Unique page views:
        /help_page/1 23 unique views
        /contact 23 unique views
        /home 23 unique views
        /index 23 unique views
        /about/2 22 unique views
        /about 21 unique views
      OUTPUT
    end

    it 'should return a list of page vists' do
      expect { subject }.to output(expected_output).to_stdout
    end
  end
end
