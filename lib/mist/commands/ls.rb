module Mist
  module Commands
    class Ls
      def call(args)
        servers = ServerLoader.new.servers

        name_width = servers.map(&:name).map(&:length).max
        user_width = servers.map(&:user).map(&:length).max
        host_width = 15
        spacer = "    "

        format_string = "%-#{name_width}s#{spacer}%-#{user_width}s#{spacer}%-#{host_width}s"

        STDOUT.puts "#{servers.count} servers"
        STDOUT.puts format_string % ["NAME", "USER", "HOST"]
        STDOUT.puts "-" * (name_width + user_width + host_width + (spacer.length * 2))
        servers.each do |server|
          STDOUT.puts format_string % [server.name, server.user, server.host]
        end
      end
    end
  end
end