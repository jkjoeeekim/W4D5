require 'byebug'

def my_min_slower(arr)
    arr.select { |num1| arr.all? { |num2| num1 <= num2 } }.first
end

# phase 1: O(n^2)
# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min_slower(list)  # =>  -5


def my_min_faster(arr)
  smallest_num = arr.first
  arr.each do |num|
    smallest_num = num if num <= smallest_num
  end
  smallest_num
end

# phase 2: O(n)
# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min_faster(list)  # =>  -5


def largest_contiguous_subsum_slower(arr)
  largest_sum = arr.first
  (0...(arr.length - 1)).each do |i|
    (i...arr.length).each do |j|
      subsum = arr[i..j].sum
      largest_sum = subsum if subsum > largest_sum
    end
  end
  largest_sum
end

# phase 1: O(n^2)
# list = [5, 3, -7]
# p largest_contiguous_subsum_slower(list) # => 8
# list1 = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum_slower(list1)
# list2 = [-5, -1, -3]
# p largest_contiguous_subsum_slower(list2)


def largest_contiguous_subsum_faster(arr)
    largest_sum = arr.first # 2 => ( +2 )
    current_seq = 0 # 2 => 5 => -1 => 5 => 12 (+1)

    arr.each do |num| #[2, 3, -6, 7, -6, 7] (n * 6)
        current_seq += num # ( +2)
        if largest_sum < current_seq # ( +1)
            largest_sum = current_seq # ( +1)
        end

        if current_seq < 0 # if we have a negative number, and we add a negative number ( +1)
            current_seq = 0 # then we'll get a smaller "more" negative result           ( + 1)
                            # if we have a negative current/running seq, we should result it to 0 to avoid this.
        end

    end

    largest_sum # ( +1)
end

# 6n + 4 --> (O(n)

# phase 2:
list = [5, 3, -7]
p largest_contiguous_subsum_faster(list) # => 8
list1 = [2, 3, -6, 7, -6, 7] # => 8
p largest_contiguous_subsum_faster(list1)
list2 = [-5, -1, -3] # => -1
p largest_contiguous_subsum_faster(list2)
