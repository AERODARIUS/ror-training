def palindrome?(word)
  if word.nil?
    return true
  end

  downcaseWord = word.downcase
  return downcaseWord == downcaseWord.reverse
end

puts palindrome?("racecar")

puts palindrome?("wagon")
