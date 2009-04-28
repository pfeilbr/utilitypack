require 'fileutils'

module UtilityPack
  module InternetExplorerHelpers
    include UtilityPack::Win32
    
    CACHE_DIRECTORIES = [
        "c:/windows/Temporary Internet Files",
        "C:/Documents and Settings/#{ENV['USERNAME']}/Local Settings/Temporary Internet Files"
      ]
    
    def self.clear_cache
      CACHE_DIRECTORIES.each do |dir|
        FileHelpers.delete Dir["#{dir}/**/*"] if File.exists?(dir)
      end
    end
    
  end
end
