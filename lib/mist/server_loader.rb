module Mist
  class ServerLoader
    def initialize(config = {})
      @paths = ['servers']
    end

    def servers
      @paths.flat_map { |path| Dir.glob("#{path}/**/*.json") }.flat_map do |file|
        Server.load(file)
      end
    end
  end
end