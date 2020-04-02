require 'pry'

class NumberGame
  def self.next_largest_number(number)
    raise "Not a valid integer value." unless number.is_a? Integer

    num = number.to_s
    total_digits = num.length

    # Number with only one digit
    if total_digits == 1
      raise "The number doesn't have enough digits to find next largest number."
    elsif total_digits == 2
      # number with 2 digits 
      if number >= num.reverse.to_i
        raise "Cannot have next larger number for #{number}"
      else
        return num.reverse.to_i
      end
    elsif num.split('').uniq.length == 1
      # All digits are same
      raise "Cannot have next larger number for #{number}"
    end

    1.upto(total_digits - 1) do |index|
      position = (total_digits - index)
      right_digit = num[position].to_i
      left_digit  = num[position - 1].to_i

      if right_digit <= left_digit
        next
      else
        left_end = position - 2
        left_part = left_end >= 0 ? num[0..left_end] : ''

        right_part = num[position..total_digits]
        right_part_digits = right_part.split('').map(&:to_i).sort

        replacement = right_part_digits.find { |digit| digit > left_digit }
        right_part_digits.slice!(right_part_digits.index(replacement))

        right_part_digits << left_digit
        sorted_right_part = right_part_digits.sort.join('')

        return "#{left_part}#{replacement}#{sorted_right_part}".to_i
      end
    end

    raise "Cannot have next larger number for #{number}"
  end
end
