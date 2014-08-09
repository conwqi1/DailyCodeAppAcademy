def fib(n)
  if n == 0
    return []
  elsif n == 1
    return [0]
  elsif n == 2
    return [0,1]
  else
    fib_value = fib(n - 1)
    fib_value << fib_value[-1] + fib_value[-2]    
  end
end

p fib(5)

