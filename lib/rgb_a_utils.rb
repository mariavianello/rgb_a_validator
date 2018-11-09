class ValidRgb
  def self.valid_rgb_a?(string)
    if classifies_strings(string) == 'standard'
      valid_rgb(string)
    elsif classifies_strings(string) == 'alpha/opacity'
      valid_rgba(string)
    else false
    end
  end





  private
  def self.classifies_strings(string)
    return 'standard' if string[0..3] == 'rgb('
    return 'alpha/opacity' if string[0..3] == 'rgba'
    false
  end
end
