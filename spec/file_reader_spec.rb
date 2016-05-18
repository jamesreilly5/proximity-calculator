require 'spec_helper'
require 'json'

RSpec.describe FileReader do
  PATH = "#{File.dirname(__FILE__)}/fixtures".freeze

  describe '.read' do
    before do
      allow_any_instance_of(Logging).to receive(:error).and_return double(Logger)
    end

    context 'when valid data is provided' do
      let(:expected_output) do
        JSON.parse(IO.read("#{PATH}/expected_valid_user_data.json").freeze)
      end

      it 'reads and extracts the data' do
        expect(FileReader.read("#{PATH}/valid_user_data.txt")).to eq expected_output
      end
    end

    context 'invalid data' do
      let(:expected_output) do
        JSON.parse(IO.read("#{PATH}/expected_corrupt_user_data.json").freeze)
      end

      context 'when corrupt data is provided' do
        let(:subject) do
          FileReader.read("#{PATH}/corrupt_user_data.txt")
        end

        xit 'logs an error' do
          expect(Logging).to receive(:error)
          subject
        end

        it 'skips the invalid lines and parses the rest' do
          expect(subject).to eq expected_output
        end
      end
    end

    context 'when file is empty' do
      it 'returns an empty data set'
    end

    context 'file does not exit' do
      it 'logs an error'
    end
  end
end
