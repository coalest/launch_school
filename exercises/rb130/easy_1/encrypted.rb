=begin
------------------------INSTRUCTIONS-------------------------------------
The following list contains the names of individuals who are pioneers in
the field of computing or that have had a significant influence on the
field. The names are in an encrypted form, though, using a simple (and
incredibly weak) form of encryption called Rot13.
-------------------------DATA/ALGO---------------------------------------

iterate through every character changing it as you go.

split the block
=end

def decrypt_rot(char)
  case char
  when 'a'..'m', 'A'..'M'
    (char.ord + 13).chr
  when 'n'..'z', 'N'..'Z'
    (char.ord - 13).chr
  else
    char
  end
end

# text_transform= Array.new
# new_words= Array.new
# File.open("encrypted.txt", "r") do |fi|
#   fi.each_line do |line|
#     text_transform << line
#   end
# end

text = <<-TEXT
Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu
TEXT

unencrypted = []

text.split('\n').each do |line|
  decrypted_word = []
  line.chars.each do |char|
    decrypted_word << decrypt_rot(char)
  end
  unencrypted << decrypted_word.join
end
puts unencrypted