# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)
    vowels = ["a", "e", "i", "o", "u"]
    fin_arr = []
    words.each.with_index do |word, i|
        words.each.with_index  do |word2, i2|
            if i2 > i 
                together = vowel_count(word) + vowel_count(word2)
                if vowels.all? {|vowel| together.include?(vowel)}
                    fin_arr << word + " " + word2
                end
            end
        end
    end
    return fin_arr
end

def vowel_count(word)
    vowels = "aeiou"
    str = ""

    word.each_char do |char|
        if vowels.include?(char)
            str += char
        end
    end

    return str

end
# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    factors = []

    (1..num).each {|ele| factors << ele if num % ele == 0}

    factors.length > 2

end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)

    bigrams.select {|pair| str.include?(pair)}

end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        
        if prc == nil
            inner_hash = {}
            self.each do |k,v|
                if k == v
                inner_hash[k] = v
                end
            end
            return inner_hash
        end

        fin_hash = {}
        self.each do |k, v|
            if prc.call(k, v)
                fin_hash[k] = v
            end
        end
    return fin_hash 

    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        fin_arr = []

        (0..self.length - 1).each do |index|
            (index..self.length - 1).each do |index2|
                fin_arr << self[index..index2]
            end
        end
        

        if length == nil
            return fin_arr
        else
            fin_arr.select {|ele| ele.length == length}
        end
    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)

        alphabet = ("a".."z").to_a

        fin_str = ""

        self.each_char do |char|
            oldi = alphabet.index(char)
            newi = oldi + num
            fin_str += alphabet[newi % 26]
        end
        fin_str
    end
end
