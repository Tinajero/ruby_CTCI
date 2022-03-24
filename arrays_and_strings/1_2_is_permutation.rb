# 1.2 Is permutation

def is_permutation?(original, permutation)
    chars_original = {}
    original.each_char do |c|
        if chars_original.has_key?(c)
            chars_original[c] = chars_original[c] + 1
        else
            chars_original[c] = 1
        end
    end

    permutation.each_char do |p|
        if chars_original.has_key?(p)
            chars_original[p] = chars_original[p] - 1
        else
            return false
        end
        if chars_original[p] == 0
            delete_key(chars_original, p)
        end
    end

    if chars_original.size > 0
        return false
    end
    return true
end

def delete_key(map, key)
    map.tap { |pair| pair.delete(key) }
end



original = "abcda"
permutation = "cbdaa"

puts is_permutation?(original, permutation)