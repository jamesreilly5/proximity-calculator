require 'spec_helper'
require 'json'

RSpec.describe FileReader do
  PATH = "#{File.dirname(__FILE__)}/fixtures".freeze

  describe '.read' do
    let(:expected_output) { JSON.parse(IO.read("#{PATH}/#{file_name}")) }
    let(:dummy_logger) { double(Logging, error: true) }

    before { allow(Logging).to receive(:logger).and_return(dummy_logger) }

    context 'when valid data is provided' do
      let(:file_name) { 'expected_valid_user_data.json' }

      it 'reads and extracts the data' do
        expect(FileReader.read("#{PATH}/valid_user_data.txt")).to eq expected_output
      end
    end

    context 'invalid data' do
      let(:file_name) { 'expected_corrupt_user_data.json' }

      context 'when corrupt data is provided' do
        let(:subject) do
          FileReader.read("#{PATH}/corrupt_user_data.txt")
        end

        it 'logs an error' do
          expect(dummy_logger).to receive(:error).exactly(8).times
          subject
        end

        it 'skips the invalid lines and parses the rest' do
          expect(subject).to eq expected_output
        end
      end
    end

    context 'when file is empty' do
      subject { FileReader.read("#{PATH}/empty_file.txt") }

      it 'returns an empty data set' do
        expect(subject).to eq []
      end

      it 'logs an error' do
        expect(dummy_logger).to receive(:error).with('File is empty or does not exist')
        subject
      end
    end
  end
end
