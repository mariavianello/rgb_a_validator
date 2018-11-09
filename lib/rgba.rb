class Rgba
  def self.valid_rgba(string)
    rgba_array = RgbValueParser.parse_rgba(string).delete_if { |number| number.empty? }
    _rgba_has_4numbers?(rgba_array) ? rgba_all_numbers_are_in_valid_range?(rgba_array) : false
  end

  def self.rgba_all_numbers_are_in_valid_range?(array)
    invalid_rgb_numbers = array[0..2].map(&:to_f).any? { |number| !Rgb._rgb_number_in_valid_range?(number) }
    return true if invalid_rgb_numbers == false && _alpha_in_valid_range?(array.map(&:to_f))
    false
  end

  private
  def self._alpha_in_valid_range?(array)
    return true if (0..1) === array[3]
    false
  end

  def self._rgba_has_4numbers?(array)
    return true if array.length == 4
    false
  end
end
