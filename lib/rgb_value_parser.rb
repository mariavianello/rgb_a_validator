class RgbValueParser
  def self.parse_rgba(string)
    string[5..-1].delete(')').split(',')
  end

  def self.parse_rgb(string)
    string[4..-1].delete(')').split(',')
  end
end
