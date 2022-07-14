# 1.4 Palindrome Permutation

def palindrom_permutation?(string)
    count_chars = {}

    string.each_char do |c|
        c = c.downcase
        next unless alpha?(c)

        if count_chars.key?(c)
            count_chars[c] = count_chars[c] + 1
        else
            count_chars[c] = 1
        end
    end

    first_odd = false
    p count_chars
    count_chars.each do |key, count|
        if odd?(count)
            return false if first_odd
            first_odd = true
        end
    end
    
    true
end

def alpha?(c)
    c >= 'a' && c <= 'z'
end

def odd?(number)
    number % 2 == 1
end

string = 'Tact Coa'

p palindrom_permutation?(string)