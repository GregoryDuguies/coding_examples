###
# DESCRIPTION
# Given a matrix, Wherever a zero is present, set the row and column to zero
#
# Input:
# Int [][] matrix
# A = [ 2, 1 ,1
#     1, 0, 1
#     2, 1, 0]
#
# Output:
# [ 2, 0 ,0
#   0, 0, 0
#   0, 0, 0]
#
# Input 2:
# Int [][] matrix
# [ 0, 1 ,1
#   1, 1, 1
#   1, 1, 1]
#
# Output2:
# Int [][] matrix
# [ 0, 0 ,0
#   0, 1, 1
#   0, 1, 1]
#
###

class ZeroMatrixRowsColumns
  def set_to_zero_if_zero(matrix)
    rows = {}
    columns = {}

    matrix.each_with_index do |row, i|
      row.each_with_index do |element, j|
         if element == 0
           rows[i] = true
           columns[j] = true
         end
      end
    end

    matrix.each_with_index do |row, i|
      row.each_with_index do |element, j|
         if rows[i] || columns[j]
           matrix[i][j] = 0
         end
      end
    end

    matrix
  end

  # def first_draft (matrix)
  #   rows = []
  #   columns = []

  #   matrix.each_with_index do |array, index|
  #     if array.include?(0)
  #       rows << index
  #     end
  #   end

  #   return matrix if rows.empty?

  #   rows.each do |row_index|
  #     matrix_row  = matrix[row_index]

  #     matrix_row.each_with_index do |row_element, i|
  #       next if columns.include?(i)

  #       if row_element == 0
  #         columns << i
  #       end
  #     end

  #     # Set matrix row to array of 0's
  #     matrix[row_index] = matrix[row_index].size.times.map{ 0 }
  #   end

  #   columns.uniq!

  #   matrix.each do |row|
  #     columns.each do |column_index|
  #       row[column_index] = 0
  #     end
  #   end

  #   matrix
  # end
end
