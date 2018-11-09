class StringValidator
  def self.valid_rgb_a?(string)
    if _classifies_strings(string) == 'standard'
      Rgb.valid_rgb(string)
    elsif _classifies_strings(string) == 'alpha/opacity'
      Rgba.valid_rgba(string)
    else false
    end
  end

  private
  def self._classifies_strings(string)
    return 'standard' if string[0..3] == 'rgb('
    return 'alpha/opacity' if string[0..3] == 'rgba'
    false
  end
end
