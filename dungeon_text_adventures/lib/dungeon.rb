require_relative 'player'
require_relative 'room'
require 'pry'

module Game
  class Dungeon
    attr_accessor :player

    def initialize(player_name)
      @player = Game::Player.new(player_name)
      @rooms = []
    end

    def start(location)
      @player.location = location
      # current_location_of(@player)
    end

    def add_room(reference, name, description, connections)
      @rooms << Game::Room.new(reference, name, description, connections)
    end

    def current_location_of(player)
      puts find_room(player.location).full_description
    end

    def find_room(location)
      @rooms.detect{|room| room.reference == location}
    end
  end
end
