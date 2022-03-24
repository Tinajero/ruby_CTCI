# string_frozen_true

# CCI 1.1
def is_unique(string)
    map = {}
    string.each_char do |c|
        if map.has_key?(c)
            return false
        else
            map[c] = 1
        end
    end
    true
end

test = "abca"
puts is_unique(test)
test_2 = "abcde"
puts is_unique(test_2)
