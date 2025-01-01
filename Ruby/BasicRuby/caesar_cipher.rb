def caesar_cipher(secret, shift)
    alphabet_low = "abcdefghijklmnopqrstuvwxyz"
    alphabet_up = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" 

    secret.each_char{ |ch| 
        if not alphabet_low.include?(ch) and not alphabet_up.include?(ch)
            print ch 
        elsif alphabet_low.include?(ch) 
            print alphabet_low[(alphabet_low.index(ch) + shift) % 26]
        else 
            print alphabet_up[(alphabet_up.index(ch) + shift) % 26]
        end 
    }

    puts

end

print "Enter secret message: "
secret = gets.chomp
print "Enter number of shifts: " 
shift = gets.chomp.to_i 
puts secret 
caesar_cipher(secret, shift)
