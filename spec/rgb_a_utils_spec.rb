require 'valid_rgb'
require 'pry'

RSpec.describe ValidRgb do
  describe '.valid_rgb_a?' do
    context 'given a non rbg a string' do
      it 'returns false' do
        result = ValidRgb.valid_rgb_a?('abc(0, 0, 0')
        expect(result).to eq(false)
      end
    end

    context 'given a correct rgb string' do
      it 'returns true' do
        result = ValidRgb.valid_rgb_a?('rgb(0,255,0)')
        expect(result).to eq(true)
      end
    end

    context 'given an incorrect rgb string' do
      it 'returns false' do
        result = ValidRgb.valid_rgb_a?('rgb(0,0,0,0)')
        expect(result).to eq(false)
      end
    end

    context 'given a correct rgba string' do
      it 'returns true' do
        result = ValidRgb.valid_rgb_a?('rgba(0,255,0,0)')
        expect(result).to eq(true)
      end
    end

    context 'given an incorrect rgba string' do
      it 'returns false' do
        result = ValidRgb.valid_rgb_a?('rgba(0,255,0,50)')
        expect(result).to eq(false)
      end
    end
  end

  describe 'valid_rgb' do
    context 'given a valid rgb string' do
      it 'returns true' do
        result = ValidRgb.valid_rgb('rgb(0,0,0)')
        expect(result).to eq(true)
      end
    end

    context 'given an invalid rgb string' do
      it 'returns false' do
        result = ValidRgb.valid_rgb('rgb(0,,0)')
        expect(result).to eq(false)
      end
    end
  end

  describe '.valid_rgba' do
    context 'given a rgba string' do
      it 'returns true' do
        result = ValidRgb.valid_rgba('rgba(0,0,0,0)')
        expect(result).to eq(true)
      end
    end

    context 'given an rgba string missing a number' do
      it 'returns false' do
        result = ValidRgb.valid_rgba('rgba(0,,0,0)')
        expect(result).to eq(false)
      end
    end
  end

  describe '.rgba_all_numbers_are_in_valid_range?' do
    context 'given a valid rgba number array' do
      it 'returns true' do
        result = ValidRgb.rgba_all_numbers_are_in_valid_range?([0,0,0,0])
        expect(result).to eq(true)
      end
    end

    context 'given an invalid number in rgba number array' do
      it 'returns false' do
        result = ValidRgb.rgba_all_numbers_are_in_valid_range?([0,256,0,0])
        expect(result).to eq(false)
      end
    end

    context 'given an invalid alpha in rgba number array' do
      it 'returns false' do
        result = ValidRgb.rgba_all_numbers_are_in_valid_range?([0,0,0,1.5])
        expect(result).to eq(false)
      end
    end

    context 'given an invalid alpha and rgba number in rgba number array' do
      it 'returns false' do
        result = ValidRgb.rgba_all_numbers_are_in_valid_range?([256,0,0,1.5])
        expect(result).to eq(false)
      end
    end
  end

  describe '.alpha_in_valid_range?' do
    context 'given a valid alpha number' do
      it 'returns true' do
        result = ValidRgb.alpha_in_valid_range?([0,0,0,0.5])
        expect(result).to eq(true)
      end
    end

    context 'given an invalid alpha' do
      it 'returns false' do
        result = ValidRgb.alpha_in_valid_range?([0,0,0,1.5])
        expect(result).to eq(false)
      end
    end
  end

  describe '.rgba_has_4numbers?' do
    context 'given array with 4 numbers' do
      it 'returns true' do
        result = ValidRgb.rgba_has_4numbers?([0,0,0,0])
        expect(result).to eq(true)
      end
    end

    context 'given array with 3 numbers' do
      it 'returns false' do
        result = ValidRgb.rgba_has_4numbers?([0,0,0])
        expect(result).to eq(false)
      end
    end
  end


  describe '.rgb_all_numbers_in_range?' do
    context 'given a valid rgb array' do
      it 'returns true' do
        result = ValidRgb.rgb_all_numbers_in_range?([0,0,0])
        expect(result).to eq(true)
      end
    end

    context 'given an invalid rgb array' do
      it 'returns false' do
        result = ValidRgb.rgb_all_numbers_in_range?([0,256,0])
        expect(result).to eq(false)
      end
    end
  end

  describe '.rgb_number_in_valid_range?' do
    context 'given a number between 0 and 255' do
      it 'returns true' do
        result = ValidRgb.rgb_number_in_valid_range?(0)
        expect(result).to eq(true)
      end
    end

    context 'given a number between 0 and 255' do
      it 'returns true' do
        result = ValidRgb.rgb_number_in_valid_range?(50)
        expect(result).to eq(true)
      end
    end

    context 'given a number between 0 and 255' do
      it 'returns true' do
        result = ValidRgb.rgb_number_in_valid_range?(255)
        expect(result).to eq(true)
      end
    end

    context 'given a number not between 0 and 255' do
      it 'returns false' do
        result = ValidRgb.rgb_number_in_valid_range?(256)
        expect(result).to eq(false)
      end
    end

    context 'given a number between 0 and 255' do
      it 'returns false' do
        result = ValidRgb.rgb_number_in_valid_range?(-1)
        expect(result).to eq(false)
      end
    end
  end

  describe '.rgb_has_3numbers?' do
    context 'given an rgb with 3 numbers' do
      it 'returns true' do
        result = ValidRgb.rgb_has_3numbers?([0,0,0])
        expect(result).to eq(true)
      end
    end

    context 'given an rgb with 4 numbers' do
      it 'returns false' do
        result = ValidRgb.rgb_has_3numbers?([0,0,0,0])
        expect(result).to eq(false)
      end
    end
  end



  describe '.classifies_strings' do
    context 'given a string that starts with rgb' do
      it 'returns standard' do
        result =  described_class.classifies_strings('rgb(0,0,0)')
        expect(result).to eq('standard')
      end
    end

    context 'given a string that starts with rgba' do
      it 'return alpha/opacity' do
        result = described_class.classifies_strings('rgba(0,0,0,0)')
        expect(result).to eq('alpha/opacity')
      end
    end

    context 'given a string that does not contain rgb or rgba' do
      it 'return invalid entry' do
        result = described_class.classifies_strings('abc(0,0,0)')
        expect(result).to eq(false)
      end
    end
  end

end
