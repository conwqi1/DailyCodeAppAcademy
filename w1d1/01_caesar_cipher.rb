def caesar_cipher(str, shift)
     alphabet = ('a'..'z').to_a
     position = shift % 26 
     str.split('').map{|letter| alphabet[(alphabet.find_index(letter) + position)]}.join
end

p caesar_cipher("abc",1)