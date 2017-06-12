require 'json'

module Mist
  class Server
    attr_reader :name, :host, :user

    def initialize(opts = {})
      @name = opts["name"]
      @host = opts["host"]
      @user = opts["user"]
    end

    def self.load(file_path)
      contents = File.open(file_path).read
      json = JSON.parse(contents)
      if json.is_a? Array
        json.map(&method(:new))
      else
        [self.new(json)]
      end
    end

    def connection_string
      "#{user}@#{host}"
    end

    def to_json
      
    end
  end
end