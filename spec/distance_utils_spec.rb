require 'spec_helper'

RSpec.describe DistanceUtils do
  let(:lat1) { 52.986375 }
  let(:lon1) { -6.043701 }
  let(:lat2) { 53.3381985 }
  let(:lon2) { -10.27699 }

  describe '.to_rad' do
    it 'converts degrees to radians' do
      expect(DistanceUtils.to_rad(lat1)).to eq 0.9247867024464104
    end
  end

  describe '.calculate' do
    context 'when valid latitude and longitudes are provided' do
      it 'calculates the circular distance' do
        expect(DistanceUtils.calculate(lat1, lon1, lat2, lon2)).to eq 284.87560217872164
      end
    end

    context 'when invalid latitude is entered' do
      let(:invalid_lat) { 91 }
      it 'throws an argument error' do
        expect { DistanceUtils.calculate(invalid_lat, lon1, lat2, lon2) }
          .to raise_error ArgumentError
      end
    end

    context 'when invalid longitude is entered' do
      let(:invalid_lon) { 181 }
      it 'throws an argument error' do
        expect { DistanceUtils.calculate(lat1, lon1, lat2, invalid_lon) }
          .to raise_error ArgumentError
      end
    end
  end
end
