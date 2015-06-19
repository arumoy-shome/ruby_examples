require 'spec_helper'

describe Location do
  Given(:cell){
  [
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
}
  Given(:location){Location.new(2, 3, cell)}

  context "it works" do
    When(:fate){location.top_row?}
    Then{expect(fate).to be false}
  end
end
