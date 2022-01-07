def odd_or_even(num)
  #num % 2 == 0 ? 'even' : 'odd'
  num.odd? ? 'odd' : 'even'
end


puts odd_or_even(2)

puts odd_or_even(3)
