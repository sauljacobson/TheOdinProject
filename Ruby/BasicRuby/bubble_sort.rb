def bubble_sort(arr) 
  startIndex = arr.size 
  for i in 0...arr.size 
    for j in 0...startIndex-1
      if arr[j] > arr[j+1]
        temp = arr[j+1] 
        arr[j+1] = arr[j]
        arr[j] = temp
      end
    end
    startIndex -= 1
  end

  arr
end 

p bubble_sort([4, 3, 78, 2, 0, 2])
