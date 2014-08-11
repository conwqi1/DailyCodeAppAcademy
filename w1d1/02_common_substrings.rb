def common_substrings(str1, str2)
	length = str1.length
	subtrings = []
	length.times do |start_position|
		(1...length - start_position).each do |sub_length|
			subtring = str1[start_position..start_position+sub_length]
             subtrings << subtring if str2.include?subtring
		end
	end
    subtrings.max_by(&:length)
end

p common_substrings("zooglensnuck", "lenscrafters")