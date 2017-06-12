module Mist
  module Commands
    Dir.glob(File.expand_path(__dir__) + "/commands/*.rb") { |file| require file }
  end
end