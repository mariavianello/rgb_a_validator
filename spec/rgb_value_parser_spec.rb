RSpec.describe RgbValueParser do
  describe '.parse_rgb' do
    context 'given an rgb string' do
      it 'returns the numbers as an array' do
        result = RgbValueParser.parse_rgb('rgb(0,0,0)')
        expect(result).to eq(['0', '0', '0'])
      end
    end
  end

  describe '.parse_rgba' do
    context 'given a rgba string' do
      it 'returns the numbers as an array' do
        result = RgbValueParser.parse_rgba('rgba(0,0,0,0)')
        expect(result).to eq(['0', '0', '0', '0'])
      end
    end

    context 'given a rgba string missing a value' do
      it 'returns the numbers as an array' do
        result = RgbValueParser.parse_rgba('rgba(0,0,,0)')
        expect(result).to eq(['0', '0', '', '0'])
      end
    end
  end
end
