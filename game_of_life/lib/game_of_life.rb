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

grid = [
  [1,0,0,1,0,1,1,0,1,1],
  [1,0,0,1,0,1,1,0,1,1],
  [1,0,0,1,0,1,1,0,1,1],
  [1,0,0,1,0,1,1,0,1,1],
  [1,0,0,1,0,1,1,0,1,1],
  [1,0,0,1,0,1,1,0,1,1],
  [1,0,0,1,0,1,1,0,1,1],
  [1,0,0,1,0,1,1,0,1,1],
  [1,0,0,1,0,1,1,0,1,1],
  [1,0,0,1,0,1,1,0,1,1]
]

neighbours = 0

def life (grid)
  grid.each_with_index do |y, y_index|
    y.each_with_index do |x, x_index|
      fate = location(x_index, y_index)

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

def location(x, y)
  if top_row?(y)
    if top_left_corner?(x)
      neighbours = grid[y][x+1] + grid[y+1][x]

    elsif top_right_corner?(x)
      neighbours = grid[y][x-1] + grid[y+1][x]

    elsif sandwich_cell?(x)
      neighbours = grid[y][x-1] + grid[y][x+1] + grid[y+1][x]
    end

  elsif bottom_row?(y)
    if bottom_left_corner?(x)
      neighbours = grid[y][x+1] + grid[y-1][x]

    elsif top_right_corner?(x)
      neighbours = grid[y][x-1] + grid[y-1][x]

    elsif sandwich_cell?(x)
      neighbours = grid[y][x-1] + grid[y][x+1] + grid[y-1][x]
    end

  elsif sandwich_row?(y)
    if first_cell?(x)
      neighbours = grid[y-1][x] + grid[y][x+1] + grid[y+1][x]

    elsif last_cell?(x)
      neighbours = grid[y-1][x] + grid[y][x-1] + grid[y+1][x]
    end

  else
    neighbours = grid[y-1][x] + grid[y][x-1] + grid[y][x+1] + grid[y+1][x]
  end
end

private

def alive?(life)
  true if life == 1 else false end
end

def top_row?(y)
  true if y == 0
end

def bottom_row?(y)
  true if y == (grid.length -1)
end

def sandwich_row?(y)
  true if 0 < y < (grid.length - 1)
end

def top_left_corner?(x)
  true if x == 0
end

def top_right_corner?(x)
  true if x == (grid.length - 1) #hacky as assumes y.length == x.length
end

def bottom_left_corner?(x)
  true if x == 0
end

def bottom_right_corner?(x)
  true if x == (grid.length - 1)
end

def first_cell?(x)
  true if x == 0
end

def last_cell?(x)
  true if x == (grid.length - 1)
end

def sandwich_cell?(x)
  true if 0 < x < (grid.length - 1)
end
