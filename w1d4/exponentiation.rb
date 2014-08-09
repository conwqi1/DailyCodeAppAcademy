def expo1(base, n)
  if n == 0 
    1
  else
    base * expo1(base, n-1)
  end
end


def expo2(base, n)
    if n == 0
      0
    elsif n == 1
      base
    elsif n.even?
      expo2(base, n / 2) ** 2
    else
      base * (expo2(base, (n - 1) / 2) * expo2(base, (n - 1) / 2))
    end
end
puts expo2(2, 3)