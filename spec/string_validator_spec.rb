RSpec.describe StringValidator do
  describe '.valid_rgb_a?' do
    context 'given a non rbg a string' do
      it 'returns false' do
        result = StringValidator.valid_rgb_a?('abc(0, 0, 0')
        expect(result).to eq(false)
      end
    end

    context 'given a correct rgb string' do
      it 'returns true' do
        result = StringValidator.valid_rgb_a?('rgb(0,255,0)')
        expect(result).to eq(true)
      end
    end

    context 'given an incorrect rgb string' do
      it 'returns false' do
        result = StringValidator.valid_rgb_a?('rgb(0,0,0,0)')
        expect(result).to eq(false)
      end
    end

    context 'given a correct rgba string' do
      it 'returns true' do
        result = StringValidator.valid_rgb_a?('rgba(0,255,0,0)')
        expect(result).to eq(true)
      end
    end

    context 'given an incorrect rgba string' do
      it 'returns false' do
        result = StringValidator.valid_rgb_a?('rgba(0,255,0,50)')
        expect(result).to eq(false)
      end
    end
  end
end
