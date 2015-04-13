require 'player'
require 'room'

module Game
  class Dungeon

    def initialize(player_name)
      @player = Game::Player.new(player_name)
      @rooms = []
    end

    def add_room(reference, name, description, connections)
      @rooms << Game::Room.new(reference, name, description, connections)
    end
  end
end
