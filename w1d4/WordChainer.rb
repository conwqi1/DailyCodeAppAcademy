require "set"
class WordChainer
  def initialize(dictionary_file_name)
    @dictionary = File.readlines(dictionary_file_name).map{|line|     
      line.chomp}.to_set
      @current_words = []
      @all_seen_words = []
  end
  
  def adjacent_words(word)
     adjacents = []
     word_arr = word.split("")
          for i in 0...word.length
          original_letter = word_arr[i]
              ("a".."z").each do |letter|
          word_arr[i] = letter 
          next if word_arr[i] == original_letter
      adjacents << word_arr.join('') if @dictionary.include?(word_arr.join(''))
      end
      word_arr[i] = original_letter         
     end
     adjacents
  end
  
  def run(source, target)
    @current_words << source
    @all_seen_words = {source => nil}
    until @current_words.empty? do
       @current_words = explore_current_words
    end
    build_path(source, target)
  end
  
  def build_path(source,target)
    path = []
    while @all_seen_words[target] != nil
      path << target
      target = @all_seen_words[target]
    end  
    path << source
    path.reverse
  end
  
  def explore_current_words
    new_current_words=[]
    @current_words.each do |current_word|
      adjacent_words(current_word).each do |adjacent_word|
        if !@all_seen_words.include?adjacent_word
           new_current_words << adjacent_word
           @all_seen_words[adjacent_word] = current_word
        end
      end
    end
    #new_current_words.each{|x|p "current: "+x+" previous: "+@all_seen_words[x]}
    new_current_words
  end
  
end
#
# a = WordChainer.new("dictionary.txt")
# a.adjacent_words("jack")
# p a.run("duck","ruby")