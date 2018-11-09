RSpec.describe Rgba do
  describe '.valid_rgba' do
    context 'given a rgba string' do
      it 'returns true' do
        result = Rgba.valid_rgba('rgba(0,0,0,0)')
        expect(result).to eq(true)
      end
    end

    context 'given an rgba string missing a number' do
      it 'returns false' do
        result = Rgba.valid_rgba('rgba(0,,0,0)')
        expect(result).to eq(false)
      end
    end
  end

  describe '.rgba_all_numbers_are_in_valid_range?' do
    context 'given a valid rgba number array' do
      it 'returns true' do
        result = Rgba.rgba_all_numbers_are_in_valid_range?([0,0,0,0])
        expect(result).to eq(true)
      end
    end

    context 'given an invalid number in rgba number array' do
      it 'returns false' do
        result = Rgba.rgba_all_numbers_are_in_valid_range?([0,256,0,0])
        expect(result).to eq(false)
      end
    end

    context 'given an invalid alpha in rgba number array' do
      it 'returns false' do
        result = Rgba.rgba_all_numbers_are_in_valid_range?([0,0,0,1.5])
        expect(result).to eq(false)
      end
    end

    context 'given an invalid alpha and rgba number in rgba number array' do
      it 'returns false' do
        result = Rgba.rgba_all_numbers_are_in_valid_range?([256,0,0,1.5])
        expect(result).to eq(false)
      end
    end
  end
end
