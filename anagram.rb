# Your code goes here!

class Anagram
  def initialize(string)
    @string = string
  end

  def match(text)
    text.select do |word|
      @string.split(//).sort.join() == word.split(//).sort.join()
    end
  end
end