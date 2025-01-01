def substrings(word, dictionary)
  occurrence = Hash.new(0)
  words = word.downcase.split 

  for substr in dictionary 
    for word in words 
      if word.include? substr
        occurrence[substr] += 1
      end
    end 
  end  
  
  occurrence 

end 

dictionary = ["below", "down", "go", "going", "horn", 
  "how", "howdy", "it", "i", "low", "own", "part", 
  "partner", "sit"]

puts substrings("below", dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary) 
