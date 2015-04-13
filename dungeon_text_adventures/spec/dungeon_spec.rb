require 'spec_helper'


describe Game::Dungeon do

  context "#add_room" do
    Given(:dungeon){Game::Dungeon.new("Player 1")}
    Given(:room){dungeon.rooms}
    When(:new_room){dungeon.add_room(:largecave, "Large Cave", "a large cave", {west: :smallcave})}
    Then{expect(new_room).to change(@room).by(+1)}
  end

end
