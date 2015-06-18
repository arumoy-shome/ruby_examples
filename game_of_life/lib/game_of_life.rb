# - Each cell is either alive (1) or dead (0)
# - if a cell is alive and has less than 2 neighbours then it dies
# - if a cell is alive and has more than 3 neighbours then it dies
# - if a cell is dead and has exactly 3 neighbours then it lives

# neighbours can be on either side, top and bottom of the cell in question

# Edge cases:
# 1. corners
  # - y == 0 && x == 0 -> add right & bottom
  # - y == 0 && x == row.length - 1 -> add left & bottom
  # - y == grid.length - 1 && x == 0 -> add right & top
  # - y == grid.length - 1 && x == row.length - 1 -> add left & top

# 2. sides
# - top: y == 0 && 0 < x < (row.length - 1) -> add left, right & bottom
# - left: 0 < y < (grid.length - 1) && x == 0 -> add top, right & bottom
# - bottom: y == (grid.length - 1) &&  0 < x < (row.length - 1) -> add left, right & top
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

#using this to keep track of edge case(s)
EDGE = [
  [0,0],
  [0,0]
]

def life (cells)
end

def location(x, y)
  if y == 0
    reduction += 1
  elsif y == cell.length -1
    reduction += 1
  elsif x == 0
    reduction += 1
  elsif x == cell.length - 1
    reduction += 1
  else
    puts "invalid location!"
  end
end

def neighbours(x, y)
  cell[y-1][x] + cell[y+1][x] + cell[y][x-1] + cell[y][x+1]
end
