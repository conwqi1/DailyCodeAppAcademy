def fibs(num)
	return [0] if num == 1
	return [0, 1] if num == 2
	fibs = fibs(num - 1)
	fibs << fibs[-1] + fibs[-2]
	fibs
end

p fibs(7)

