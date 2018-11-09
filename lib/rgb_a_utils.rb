class ValidRgb
  def self.valid_rgb_a?(string)
    if classifies_strings(string) == 'standard'
      valid_rgb(string)
    elsif classifies_strings(string) == 'alpha/opacity'
      valid_rgba(string)
    else false
    end
  end


  def self.valid_rgba(string)
    rgba_array = RgbValueParser.parse_rgba(string).delete_if { |number| number.empty? }
    rgba_has_4numbers?(rgba_array) ? rgba_all_numbers_are_in_valid_range?(rgba_array) : false
  end

  def self.rgba_all_numbers_are_in_valid_range?(array)
    invalid_rgb_numbers = array[0..2].map(&:to_f).any? { |number| !rgb_range?(number) }
    return true if invalid_rgb_numbers == false && alpha_in_valid_range?(array.map(&:to_f))
    false
  end

  def self.alpha_in_valid_range?(array)
    return true if (0..1) === array[3]
    false
  end

  def self.rgba_has_4numbers?(array)
    return true if array.length == 4
    false
  end


  def self.valid_rgb(string)
    rgb_array = RgbValueParser.parse_rgb(string).delete_if { |number| number.empty? }
    rgb_has_3numbers?(rgb_array) ? rgb_all_numbers_in_range?(rgb_array) : false
  end

  def self.rgb_all_numbers_in_valid_range?(array)
    results_array = array.map(&:to_f).map { |number| rgb_range?(number) }
    # results_array = array.map(&:to_f).any? { |number| rgb_range?(number) }
    false_array = results_array.select { |item| item == false }
    return true if false_array.empty?
    return false if false_array.length >= 1
  end

  def self.rgb_number_in_valid_range?(number)
    return true if number.between?(0, 255)
    false
  end

  def self.rgb_has_3numbers?(array)
    return true if array.length == 3
    false
  end

  private
  def self.classifies_strings(string)
    return 'standard' if string[0..3] == 'rgb('
    return 'alpha/opacity' if string[0..3] == 'rgba'
    false
  end
end
