def merge_sort(arr)
  if arr.size > 1
    # Split the array into two and call recursively
    left, right = arr.each_slice((arr.size/2.0).round).to_a
    return merge_and_sort_array(left, right)
  end

  return arr
end

def merge_and_sort_array(arr_left, arr_right)
  merged_arr = []
  li = 0;
  ri = 0;

  # Order two halves recursively
  left_sorted = merge_sort(arr_left)
  right_sorted = merge_sort(arr_right)

  # Merge in order
  while li < left_sorted.size and ri < right_sorted.size
    first_left = left_sorted[li]
    first_right = right_sorted[ri]

    if first_left < first_right
      merged_arr << first_left
      li += 1
    else 
      merged_arr << first_right
      ri += 1
    end
  end

  # Add the remaining entries
  while li < left_sorted.size
    merged_arr << left_sorted[li]
      li += 1
  end

  while ri < right_sorted.size
    merged_arr << right_sorted[ri]
      ri += 1
  end

  return merged_arr
end

# Alternative option, less funny
# def merge_and_sort_array(arr1, arr2)
#   (arr1 + arr2).sort
# end

puts merge_and_sort_array(['Z', 'B', 'C'], ['A', 'D']) 
