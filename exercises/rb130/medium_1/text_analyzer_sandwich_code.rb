class TextAnalyzer
  def process
    File.open("sample_text.txt", "r") { |f| yield(f.read) }
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split(/\n\n/).count} paragraphs" }
analyzer.process { |text| puts "#{text.lines.size} lines" }
analyzer.process { |text| puts "#{text.split.size} words"}