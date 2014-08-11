def fibs(num)
   return [0] if num == 1
   return [0,1] if num == 2
   fibs_number = fibs(num -1)
   fibs_number << fibs_number.last + fibs_number[-2]
   fibs_number
end

