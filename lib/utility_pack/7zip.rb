module UtilityPack
  # Wrapper around the rar archiving and compression utility
  module SevenZip
    include UtilityPack::Win32

    # creates a 7-zip archive for the specified files/directories
    # archive_path - archive file that'll be created
    # *paths - files/directories to archive
    def self.zip archive_path, *paths
      CoreHelpers.s "7za a -tzip \"#{archive_path}\" " +paths.flatten.collect{|p| "\"#{p}\""}.join(' ')
    end
    
    def self.sfx archive_path, *paths
      CoreHelpers.s "7za a -sfx7z.sfx \"#{archive_path}\" " +paths.flatten.collect{|p| "\"#{p}\""}.join(' ')
    end
    
  end
end
