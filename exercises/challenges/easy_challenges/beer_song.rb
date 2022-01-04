=begin
PEDAC



=end
class BeerSong
  THIRD_TO_LAST = "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"

  SECOND_TO_LAST =  "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"

  LAST_LINE = "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"

  LINE = "XX bottles of beer on the wall, XX bottles of beer.\n" \
      "Take one down and pass it around, YY bottles of beer on the wall.\n"

  def self.verses(first, last)
    output = ''
    first.downto(last) do |num|
      output += self.verse(num) + "\n"
    end
    output.chomp
  end
  
  def self.verse(num)
    case num
    when 2
      LINE.gsub(/XX/, num.to_s).gsub(/YY bottles/, "1 bottle")
    when 1
      LINE.gsub(/XX bottles/, "1 bottle").gsub(/YY/, "no more").gsub(/one/, 'it')
    when 0
      LAST_LINE
    else
      LINE.gsub(/XX/, num.to_s).gsub(/YY/, (num - 1).to_s)
    end
  end

  def self.lyrics
    self.verses(99,0)
  end
end
