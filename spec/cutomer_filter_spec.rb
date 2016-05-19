require 'spec_helper'

RSpec.describe CustomerFilter do
  let(:input) do
    [
      { 'latitude' => '52.986375', user_id: 1, name: 'Christina McArdle', 'longitude' => '-6.043701' },
      { 'latitude' => '55.986375', user_id: 12, name: 'Steve O', 'longitude' => '-8.043701' },
      { 'latitude' => '53.986375', user_id: 4, name: 'Shane Gibb', 'longitude' => '-6.043701' },
      { 'latitude' => '59.986375', user_id: 3, name: 'Guillaume Hamaddi', 'longitude' => '-6.043701' }
    ]
  end

  describe '.by_proximity' do
    let(:expected_output) do
      [
        { 'latitude' => '52.986375', user_id: 1, name: 'Christina McArdle', 'longitude' => '-6.043701' },
        { 'latitude' => '53.986375', user_id: 4, name: 'Shane Gibb', 'longitude' => '-6.043701' }
      ]
    end

    it 'filters by proximity' do
      expect(CustomerFilter.proximity(input, 100)).to eq expected_output
    end
  end

  describe '.sort_by_id' do
    let(:sorted_output_by_id) do
      [
        { 'latitude' => '52.986375', user_id: 1, name: 'Christina McArdle', 'longitude' => '-6.043701' },
        { 'latitude' => '59.986375', user_id: 3, name: 'Guillaume Hamaddi', 'longitude' => '-6.043701' },
        { 'latitude' => '53.986375', user_id: 4, name: 'Shane Gibb', 'longitude' => '-6.043701' },
        { 'latitude' => '55.986375', user_id: 12, name: 'Steve O', 'longitude' => '-8.043701' }
      ]
    end
    let(:sorted_output_by_id_desc) do
      [
        { 'latitude' => '55.986375', user_id: 12, name: 'Steve O', 'longitude' => '-8.043701' },
        { 'latitude' => '53.986375', user_id: 4, name: 'Shane Gibb', 'longitude' => '-6.043701' },
        { 'latitude' => '59.986375', user_id: 3, name: 'Guillaume Hamaddi', 'longitude' => '-6.043701' },
        { 'latitude' => '52.986375', user_id: 1, name: 'Christina McArdle', 'longitude' => '-6.043701' }
      ]
    end

    it 'sorts by user id' do
      expect(CustomerFilter.sort_by_id(input, false)).to eq sorted_output_by_id
    end

    it 'sorts by user id descending' do
      expect(CustomerFilter.sort_by_id(input, true)).to eq sorted_output_by_id_desc
    end
  end
end
