require 'spec_helper'

describe Game do
  Given(:grid){[
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
  ]}
  Given(:new_game){Game.new(grid)}

  describe 'Game#alive?' do
    context 'is alive' do
      When(:life){new_game.alive?(1)}
      Then{expect(life).to eq true}
    end

    context "is not alive" do
      When(:life){new_game.alive?(0)}
      Then{expect(life).to eq false}
    end
  end

  describe 'location' do
    context 'within the grid' do
      When(:location){new_game.location(0, 0)}
      Then{expect(location).to eq 1}
    end

    context 'another within grid' do
      When(:location){new_game.location(1, 5)}
      Then{expect(location).to eq 0}
    end

    context 'outside the grid' do
      When(:location){new_game.location(10, 11)}
      Then{expect(location).to eq 0}
    end
  end

  describe 'life' do
    context 'first itiration' do
      Given{new_game.life}
      Then{expect(grid[0,0]).to eq 0}
    end
  end
end
