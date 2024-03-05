###
# DESCRIPTION
# Given an array of intervals where intervals[i] = [starti, endi], merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.
#
# Example 1:
# Input: intervals = [[8,10],[1,3],[2,6],,[15,18]]
# Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
# Output: [[1,6],[8,10],[15,18]]
# Explanation: Since intervals [1,3] and [2,6] overlap, merge them into [1,6].
#
# Example 2:
# Input: intervals = [[1,4],[4,5]]
# Output: [[1,5]]
# Explanation: Intervals [1,4] and [4,5] are considered overlapping.
###

class ConcatOverlappingIntervals
  def concat_intervals_array (intervals_array)

    # Sort tuples by first element to compare successive array elements to each other
    intervals_array.sort!{ |tuple_a, tuple_b| tuple_a[0] <=> tuple_b[0] }

    holding_tuple = intervals_array.first
    output_array = []

    (1...intervals_array.size).each do |index|

      # Compare current tuple ends before next tuple starts
      if holding_tuple[1] >= intervals_array[index][0]

        # Only update tuple end element if the successive tuple end is greater
        holding_tuple[1] = intervals_array[index][1] if holding_tuple[1] < intervals_array[index][1]
      else
        output_array << holding_tuple

        holding_tuple = intervals_array[index]
      end
    end

    # Insert last element
    output_array << holding_tuple

    output_array
  end
end
