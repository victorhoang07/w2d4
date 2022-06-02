

def no_dupes?(arr)
    hash = Hash.new(0)
    fin_arr = []
    arr.each {|ele| hash[ele] += 1}

    hash.each {|k,v| fin_arr << k if v == 1}

    return fin_arr
end
p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(arr)
    i = 0
    while i < arr.length - 1
        return false if arr[i] == arr[i + 1]
        i += 1
    end
    return true
    
end

p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
    hash = Hash.new {|h,k| h[k] = []}

    str.each_char.with_index do |char, i|
        hash[char] << i
    end
    hash
end

p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}


def longest_streak(str)
    
    # hash = Hash.new(0)

    # str.each_char {|ele| hash[ele] += 1}

    # largest = hash.select {|k,v| hash[k] == hash.values.max}

    # return largest.to_a.last[0] * largest.to_a.last[1]

    current = ""
    longest = ""
    i = 0 #a

    while i < str.length
        count = 1

        i2 = i + 1
        while i2 < str.length 
            if str[i2] != str[i]
                break 
            else 
                count += 1
            end
            i2 += 1
        end

        current = str[i] * count
        if current.length > longest.length || current.length == longest.length
            longest = current
        end
        i += 1
    end

    return longest

end

p longest_streak('a')           # => 'a'
p longest_streak('accccbbb')    # => 'cccc'
p longest_streak('aaaxyyyyyzz') # => 'yyyyy
p longest_streak('aaabbb')      # => 'bbb'
p longest_streak('abc')         # => 'c'
def prime?(num)
    return false if num < 2

    (2...num).each do |ele|
        if num % ele == 0
            return false
        end
    end
    return true 
end

def bi_prime?(num)

    (2..num).each do |num1|
        (2...num).each do |num2|
            if prime?(num1) && prime?(num2) && num1 * num2 == num
                return true
            end
        end
    end
    return false
end

p bi_prime?(14)   # => true
p bi_prime?(22)   # => true
p bi_prime?(25)   # => true
p bi_prime?(94)   # => true
p bi_prime?(24)   # => false
p bi_prime?(64)   # => false

def vigenere_cipher(str, keys) #("toerrishuman", [1, 2])
    alphabet = ("a".."z").to_a

    fin_str = ""

        str.each_char.with_index do |char, i|
            # if i == 0
            # oldi = alphabet.index(char)
            # newi = oldi + keys[0]
            # fin_str += alphabet[newi % 26]
            # else
            oldi = alphabet.index(char)
            newi = oldi + keys[i % keys.length]
            fin_str += alphabet[newi % 26]
            # end
        end
        fin_str
end

p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def vowel_rotate(str)

    vowels = "aeiou"
    words_vowels = []
    fin_str = ""

    str.each_char {|char| words_vowels << char if vowels.include?(char)}
    rotated = words_vowels.rotate(words_vowels.length - 1)
    i = 0
    str.each_char do |char|
        if vowels.include?(char)
            fin_str += rotated[i]
            i += 1
        else
            fin_str += char
        end
    end
    return fin_str
end

p vowel_rotate('computer')      # => "cempotur"
p vowel_rotate('oranges')       # => "erongas"
p vowel_rotate('headphones')    # => "heedphanos"
p vowel_rotate('bootcamp')      # => "baotcomp"
p vowel_rotate('awesome')       # => "ewasemo"

class String

    def select(&prc)
        if prc.nil?
            return ""
        end
        fin_str = ""
        self.each_char do |char|
            if prc.call(char)
                fin_str += char
            end
        end
        return fin_str
    end


    def map!(&prc)

        self.each_char.with_index do |char, i|
            self[i] = prc.call(char, *i)
        end
        return self

    end

end

word_1 = "Lovelace"
word_1.map! do |ch| 
    if ch == 'e'
        '3'
    elsif ch == 'a'
        '4'
    else
        ch
    end
end
p word_1        # => "Lov3l4c3"

word_2 = "Dijkstra"
word_2.map! do |ch, i|
    if i.even?
        ch.upcase
    else
        ch.downcase
    end
end
p word_2        # => "DiJkStRa"


p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
p "HELLOworld".select          # => ""

def multiply(a, b)
    return 0 if b == 0
    
    if b > 0
        a + multiply(a, b - 1)
    else
        multiply(a, b + 1) - a 
    end
end

p multiply(3, 5)        # => 15
p multiply(5, 3)        # => 15
p multiply(2, 4)        # => 8
p multiply(0, 10)       # => 0
p multiply(-3, -6)      # => 18
p multiply(3, -6)       # => -18
p multiply(-3, 6)       # => -18

def lucas_sequence(n)
    return [] if n == 0
    return [2] if n == 1
    return [2, 1] if n == 2

    base = lucas_sequence(n - 1)
    sum = base[-1] + base[-2]
    base << sum
    return base
end
p lucas_sequence(0)   # => []
p lucas_sequence(1)   # => [2]    
p lucas_sequence(2)   # => [2, 1]
p lucas_sequence(3)   # => [2, 1, 3]
p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

def prime_factorization(num)
    return [num] if prime?(num)
    factors = [] #[2 3 4,6 8 12]
    (2..num).each do |ele|
        if num % ele == 0
            other = num / ele
            return [ *prime_factorization(ele), *prime_factorization(other)]
        end
    end


end

p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(7)      # => [7]
p prime_factorization(11)     # => [11]
p prime_factorization(2017)   # => [2017]