# - Each cell is either alive (1) or dead (0)
# - if a cell is alive and has less than 2 neighbours then it dies
# - if a cell is alive and has more than 3 neighbours then it dies
# - if a cell is dead and has exactly 3 neighbours then it lives

# neighbours can be on either side, top and bottom of the cell in question

# Edge cases:
# 1. corners
  # - y == 0 && x == 0 -> add right & bottom
  # - y == 0 && x == (row.length - 1) -> add left & bottom
  # - (y == grid.length - 1) && x == 0 -> add right & top
  # - (y == grid.length - 1) && x == (row.length - 1) -> add left & top

# 2. sides
# - top: y == 0 && 0 < x < (row.length - 1) -> add left, right & bottom
# - bottom: y == (grid.length - 1) &&  0 < x < (row.length - 1) -> add left, right & top
# - left: 0 < y < (grid.length - 1) && x == 0 -> add top, right & bottom
# - right: 0 < y < (grid.length - 1) && x == (cell.length - 1) < n < row.length -> add left, right & bottom

# architecture:
# - method to detect location of cell (see if it is an edge case) -> track through a 2-D array
# - method to count neighbours and return it
# - life method makes the appropriate decision depending on count

# example_grid = [
#   [1,0,0,1,0,1,1,0,1,1],
#   [1,0,0,1,0,1,1,0,1,1],
#   [1,0,0,1,0,1,1,0,1,1],
#   [1,0,0,1,0,1,1,0,1,1],
#   [1,0,0,1,0,1,1,0,1,1],
#   [1,0,0,1,0,1,1,0,1,1],
#   [1,0,0,1,0,1,1,0,1,1],
#   [1,0,0,1,0,1,1,0,1,1],
#   [1,0,0,1,0,1,1,0,1,1],
#   [1,0,0,1,0,1,1,0,1,1]
# ]

class Game

  def initialize(grid)
    @grid = grid
  end

  def life (grid)
    grid.each_with_index do |y, y_index|
      y.each_with_index do |x, x_index|
        fate = location(x_index + 1, y_index) + location(x_index - 1, y) + location(x_index, y_index - 1) + location(x_index, y_index + 1)

        if alive?(x) && fate < 2
          x = 0
        elsif alive?(x) && fate > 3
          x = 0
        elsif !alive?(x) && fate == 3
          x = 1
        else
          # something fishy
        end
      end
    end
  end

  # private

  def alive?(life)
    life == 1 ? true : false
  end

  def location(x, y)
    if x < 0 || x >= @grid.length || y < 0 || y >= @grid.length
      return 0
    else
      return @grid[y][x]
    end
  end
end
