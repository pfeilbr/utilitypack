require 'fileutils'

module UtilityPack
  module Win32
    module FileHelpers
      
      MAX_DELETE_FILE_RETRIES = 20
      
      def delete_file path
        count = 0
        while File.exist?(path) && count < MAX_DELETE_FILE_RETRIES do
          puts "Deleting file #{path}"
          rm_f path
          count = count + 1
        end
      end
      
      def delete_directory path
        puts "Deleting directory #{path}"
        rm_rf path if File.directory?(path)
      end
      
      def delete(*args)
        args.flatten.each do |path|
          delete_file path unless File.directory?(path)
          delete_directory path if File.directory?(path)
        end
      end
      
      # add all instance methods as singleton methods also
      self.extend(self)
      include FileUtils
    end
  end
end
