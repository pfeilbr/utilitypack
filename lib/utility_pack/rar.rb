module UtilityPack
  # Wrapper around the rar archiving and compression utility
  module Rar
    include UtilityPack::Win32

    # creates a rar archive for the specified files/directories
    # archive_path - archive file that'll be created
    # *paths - files/directories to archive
    def self.rar archive_path, *paths
      CoreHelpers.s "rar a -m5 \"#{archive_path}\" " +paths.flatten.collect{|p| "\"#{p}\""}.join(' ')
    end
    
    def self.sfx archive_path, *paths
      CoreHelpers.s "rar a -sfx \"#{archive_path}\" " +paths.flatten.collect{|p| "\"#{p}\""}.join(' ')
    end    
    
  end
end
