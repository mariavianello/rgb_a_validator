class Rgb
  def self.valid_rgb(string)
    rgb_array = RgbValueParser.parse_rgb(string).delete_if { |number| number.empty? }
    _rgb_has_3numbers?(rgb_array) ? rgb_all_numbers_in_valid_range?(rgb_array) : false
  end

  def self.rgb_all_numbers_in_valid_range?(array)
    invalid_rgb_numbers = array.map(&:to_f).any? { |number| !_rgb_number_in_valid_range?(number) }
    return true if invalid_rgb_numbers == false
    false

    # results_array = array.map(&:to_f).map { |number| _rgb_number_in_valid_range?(number) }
    # false_array = results_array.select { |item| item == false }
    # return true if false_array.empty?
    # return false if false_array.length >= 1
  end

  private
  def self._rgb_number_in_valid_range?(number)
    return true if number.between?(0, 255)
    false
  end

  def self._rgb_has_3numbers?(array)
    return true if array.length == 3
    false
  end
end
