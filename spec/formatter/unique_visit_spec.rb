require_relative '../../lib/formatter/unique_visit'

describe Formatter::UniqueVisit do
  subject { described_class.new(padding).format(parsed_results) }

  context 'with parsed results' do
    let(:parsed_results) do
      {
        '/index' => %w[8.9.3.1 5.6.7.8 2.3.4.5],
        '/home' => %w[1.2.3.4 1.2.3.4],
        '/contact' => %w[5.6.7.3]
      }
    end
    let(:padding) { 13 }
    let(:expected_output) do
      <<~OUTPUT
        Unique page views:
        /index        3 unique views
        /home         1 unique views
        /contact      1 unique views
      OUTPUT
    end

    it 'returns the correct output' do
      expect(subject).to eq(expected_output.chomp)
    end
  end
end