def word_counter(sentence)
  sentence.scan(/\w+/im).size
end

puts word_counter("The quick brown fox jumps over the lazy dog")

puts word_counter("Le Wagon")
 