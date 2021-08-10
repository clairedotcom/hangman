class Dictionary

    def initialize
        @dictionary = 'dictionary.txt'
    end    

    def set_word
        lines = File.readlines(@dictionary)
        dict_length = File.readlines(@dictionary).size

        word = ""

        until word.length > 5 && word.length < 12 do
            index = rand(1..dict_length)
            word = lines[index].strip.chars
        end

        return word
    end    

end    