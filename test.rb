# def is_it_in_the_array_advanced (string, array, strict)
#     a = true
#     for i in array
#         if strict == true
#             if i == string
#                 a = true
#             else
#                 a = false
#                 next
#             end
#         else
#             if i.downcase == string.downcase
#                 a = true
#             else
#                 a = false
#                 next
#             end
#         end
#     end
#     return a
# end

# is_it_in_the_array_advanced("Hello", ["llo", "howdy", "hello"], false)


def is_it_in_the_array_advanced(string, array, strict)
    if array == []
        return false
    elsif strict == true
        i = 0
        while array.length > i
            if array[i] == string
                puts "true"
                return true
            else
                i += 1
            end
        end
        puts "false"
        return false
    else
        i = 0
        while array.length > i
            if array[i].downcase == string.downcase
                puts "true"
                return true
            else
                i += 1
            end
        end
        puts "false"
        return false
    end
end

is_it_in_the_array_advanced("Hello", ["hello", "goodbye", "howdy"], false)