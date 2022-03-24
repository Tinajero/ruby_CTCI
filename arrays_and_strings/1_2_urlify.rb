def urlify(string)
    string.gsub(' ', '%20')
end

# O(n^2)
def urlify_in_place(string)
    array = string.chars
    replace = '%20'
    places = replace.size
    
    for index in 0..array.size do
        if array[index] == ' '
            move_string(array, index, places)
            
            replace.each_char do |c|
                array[index] = c
                index += 1
            end
        end
    end

    array.join
end

def move_string(array, index, places)
    last_char = array.size - places
    last_index = array.size - 1
    #puts "index: #{index}"
    #puts "array: #{array}"
    #puts "last_char: #{last_char}"
    #puts "last_index: #{last_index}"
    for i in index..(array.size - places) do #  I can iterate a for in the inverse mode ?
        array[last_index] = array[last_char]
        last_index = last_index - 1
        last_char = last_char - 1 
    end
end

# O(n)
def urlify_in_place_n(string)
    replace = '%20'
    to_replace = ' '
    shifts = calculate_shifts(string, to_replace, replace.size)
    # puts "Shifts #{shifts}"
    last_char_index = string.size - 1 - shifts
    last_index = string.size - 1
    for count in 0..(string.size - shifts)
        # puts "last_char_index #{last_char_index} last_index #{last_index} string[last_char_index] #{string[last_char_index]}"
        if string[last_char_index] == ' '
            
            string[last_index] = '0'
            string[last_index - 1] = '2'
            string[last_index - 2] = '%'

            last_index -= 2
        else
            string[last_index] = string[last_char_index]
        end
        last_index -= 1
        last_char_index -= 1
    end
    string
end

# O(n)
def calculate_shifts(string, char, places)
    i = 0
    last_index = string.size 
    shifts = 0
    while i < last_index
        if string[i] == char
            last_index -= places
            shifts += places - 1
        end
        i += 1
    end

    shifts
end

# abcde
# 
# 2
# xx
# 1 -> b
# size = 5
# last_char = 5 - 2 = 1
# last_index = 2
# 1..3 = [1 2 3]
# [ a b b c d ]
 
string = "Mr John Smith    "

puts urlify_in_place_n(string)