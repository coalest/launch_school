class Cipher
  def self.encode(string)
    chars = string.gsub(/[^a-z0-9]/i, '').downcase.chars
    output = ''
    chars.each_with_index do |char, i|
      output << ' ' if i % 5 == 0 && i != 0
      output << Cipher.convert(char)
    end
    output
  end

  def self.convert(char)
    return char unless (97..122).include?(char.ord)
    i = char.ord - 97
    new_i = char.ord + 25 - 2 * i
    new_i.chr
  end
end
