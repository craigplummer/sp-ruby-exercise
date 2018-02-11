require_relative '../lib/log_file_parser.rb'

describe LogFileParser do
  subject { described_class.new(log_file_path).parse }

  context 'with non existing file' do
    let(:log_file_path) { '' }

    it 'should raise a missing file error' do
      expect { subject }.to raise_error(LogFileNotFound)
    end
  end
end
