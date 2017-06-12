module Mist
  module Commands
    class Ssh
      def call(args)
        servers = ServerLoader.new.servers

        server_name = args[1]
        command = args[2]

        if server_name.nil?
          STDOUT.puts "USAGE: mist ssh *server* *command*"
          return
        end

        server = servers.detect { |s| s.name == server_name }

        if server.nil?
          STDOUT.puts "No server found: \"#{server_name}\""
          return
        end

        exec "ssh #{server.connection_string} \"#{command}\""
      end
    end
  end
end