require 'spec_helper'


describe Game::Dungeon do
  Given(:dungeon){Game::Dungeon.new("Player 1")}
  Given(:rooms){dungeon.instance_variable_get(:@rooms)}
  Given(:player){dungeon.player}

  context "#start" do
    Given(:location){:maincave}
    When{dungeon.start(location)}
    Then{expect(player.location).to be == location}
  end

  context "#add_room" do
    When{dungeon.add_room(:largecave, "Large Cave", "a large cave", {west: :smallcave})}
    Then{expect(rooms).not_to be_empty}
  end

  context "#current_location_of" do
    Given(:room){dungeon.add_room(:maincave, "Main Cave", "This is the main cave", {north: :passage})}
    When{dungeon.current_location_of(player)}
    Then{expect(STDOUT).to receive(:puts).and_return("#{room.name}\n\nYou are in #{room.description}")}
  end
end
