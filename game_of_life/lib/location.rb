class Location

  def initialize(x, y, cell)
    @x = x
    @y = y
    @cell = cell
  end

  def locator
    if top_row?
      if top_left_corner?
        grid[@y][@x+1] + grid[@y+1][@x]

      elsif top_right_corner?
        grid[@y][@x-1] + grid[@y+1][@x]

      elsif sandwich_cell?
        grid[@y][@x-1] + grid[@y][@x+1] + grid[@y+1][@x]
      end

    elsif bottom_row?
      if bottom_left_corner?
        grid[@y][@x+1] + grid[@y-1][@x]

      elsif top_right_corner?
        grid[@y][@x-1] + grid[@y-1][@x]

      elsif sandwich_cell?
        grid[@y][@x-1] + grid[@y][@x+1] + grid[@y-1][@x]
      end

    elsif sandwich_row?
      if first_cell?
        grid[@y-1][@x] + grid[@y][@x+1] + grid[@y+1][@x]

      elsif last_cell?
        grid[@y-1][@x] + grid[@y][@x-1] + grid[@y+1][@x]
      end

    else
      grid[@y-1][@x] + grid[@y][@x-1] + grid[@y][@x+1] + grid[@y+1][@x]
    end
  end

  private

  def top_row?
    true if @y == 0
  end

  def bottom_row?
    true if @y == (grid.length -1)
  end

  def sandwich_row?
    true if 0 < @y < (grid.length - 1)
  end

  def top_left_corner?
    true if @x == 0
  end

  def top_right_corner?
    true if @x == (grid.length - 1) #hacky as assumes y.length == x.length
  end

  def bottom_left_corner?
    true if @x == 0
  end

  def bottom_right_corner?
    true if @x == (grid.length - 1)
  end

  def first_cell?
    true if @x == 0
  end

  def last_cell?
    true if @x == (grid.length - 1)
  end

  def sandwich_cell?
    true if 0 < @x < (grid.length - 1)
  end
end
