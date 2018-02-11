require_relative '../lib/outputter'

describe Outputter do
  subject { described_class.new(parsed_response, formatters).perform }
  let(:parsed_response) do
    {
      '/index' => %w[8.9.3.1 5.6.7.8 2.3.4.5],
      '/home' => %w[1.2.3.4 1.2.3.4],
      '/contact' => %w[5.6.7.3]
    }
  end

  context 'with parsed response and total visit formatter' do
    let(:formatters) do
      [Formatter::TotalVisit]
    end

    let(:expected_output) do
      <<~OUTPUT
        Total page views:
        /index        3 visits
        /home         2 visits
        /contact      1 visits

      OUTPUT
    end

    it 'should output the expected output to stdout' do
      expect { subject }.to output(expected_output).to_stdout
    end
  end

  context 'with parsed response and unique visit formatter' do
    let(:formatters) do
      [Formatter::UniqueVisit]
    end

    let(:expected_output) do
      <<~OUTPUT
        Unique page views:
        /index        3 unique views
        /home         1 unique views
        /contact      1 unique views

      OUTPUT
    end

    it 'should output the expected output to stdout' do
      expect { subject }.to output(expected_output).to_stdout
    end
  end

  context 'with parsed response, total visit and unique visit formatter' do
    let(:formatters) do
      [Formatter::TotalVisit, Formatter::UniqueVisit]
    end

    let(:expected_output) do
      <<~OUTPUT
        Total page views:
        /index        3 visits
        /home         2 visits
        /contact      1 visits

        Unique page views:
        /index        3 unique views
        /home         1 unique views
        /contact      1 unique views

      OUTPUT
    end

    it 'should output the expected output to stdout' do
      expect { subject }.to output(expected_output).to_stdout
    end
  end
end
