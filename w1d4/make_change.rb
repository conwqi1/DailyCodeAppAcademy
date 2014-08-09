def make_change(change_amount, available_coins)
  
  if change_amount == 0
    return []
  else
    useful_coins = available_coins.select { |coin| coin <= change_amount }
    greatest_possible_coin = useful_coins.max
    remaining_change = change_amount - greatest_possible_coin
    [greatest_possible_coin] + make_change(remaining_change, useful_coins)
  end
end

#p make_change(32, [25, 10, 5, 1])


#loop thru a shrinking set of available coins
def make_smart_change(change_amount, available_coins)
  possible_answers = []
  while available_coins.length > 1 do
    possible_answers << make_change(change_amount, available_coins)
    
    #compare best answer
    # this_answer = make_smart_change(x,y)
    # if best_ans.length > this_answer
    #   best_ans = this_answer
    # end
    next if available_coins.length == 1
    available_coins = available_coins[1..-1]
  end
  
  #pick shortest length array within possible_answers
  possible_answers.sort_by(&:length)[0]
  
end

p make_smart_change(32, [25, 10, 5, 1])

