def super_print string, options = {}
  defaults = {
    times: 1,
    upcase: false,
    reverse: false,
  }
  values = defaults.merge(options)
  output = string.dup

  output.upcase! if values[:upcase]
  output.reverse! if values[:reverse]
  
  values[:times].times do 
    puts output
  end

end

super_print("Hello")
super_print("Hello", times: 3)
super_print("Hello", reverse: true)
super_print("Hello", upcase: true)