require 'spec_helper'

describe Location do
  let(location){Location.new(2, 3)}

  it "works..." do
    expect(location.top_row?).to eq false
  end
end
