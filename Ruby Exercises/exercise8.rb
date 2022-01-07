def  can_you_vote?(age)
  age >= 18
end
  
puts (can_you_vote?(18) & can_you_vote?(30))

puts can_you_vote?(16)
