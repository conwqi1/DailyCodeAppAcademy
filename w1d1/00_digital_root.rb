def digital_root(num)
	until digital_root_step(num).count == 1
		num = digital_root_step(num).inject{ |mem, var| mem += var }
	end
	num
end


def digital_root_step(num)
	n = 1
	digits = []
    until num < 1
    	digits << (num % 10)
    	num = num / 10
    end
    digits.reverse
end
