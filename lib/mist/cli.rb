
module Mist
  class CLI

    def self.run
      require 'mist'

      case ARGV[0].downcase
      when 'ls', 'list' then Commands::Ls.new.(ARGV)
      when 'ssh' then Commands::Ssh.new.(ARGV)
      else
        STDOUT.puts "Not a valid command"
      end

    end
  end
end