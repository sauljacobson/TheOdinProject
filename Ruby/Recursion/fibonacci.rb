def fib_rec(n) 
  if n <= 1
    return n
  else
    return fib_rec(n-1) + fib_rec(n-2)
  end
end

def fib_it(n) 
end
  

puts fib_rec(1)
