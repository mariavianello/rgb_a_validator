RSpec.describe Rgb do
  describe 'valid_rgb' do
    context 'given a valid rgb string' do
      it 'returns true' do
        result = Rgb.valid_rgb('rgb(0,0,0)')
        expect(result).to eq(true)
      end
    end

    context 'given an invalid rgb string' do
      it 'returns false' do
        result = Rgb.valid_rgb('rgb(0,,0)')
        expect(result).to eq(false)
      end
    end
  end

  describe '.rgb_all_numbers_in_valid_range?' do
    context 'given a valid rgb array' do
      it 'returns true' do
        result = Rgb.rgb_all_numbers_in_valid_range?([0,0,0])
        expect(result).to eq(true)
      end
    end

    context 'given an invalid rgb array' do
      it 'returns false' do
        result = Rgb.rgb_all_numbers_in_valid_range?([0,256,0])
        expect(result).to eq(false)
      end
    end
  end

end
