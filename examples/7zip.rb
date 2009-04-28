require 'fileutils'
require 'utility_pack'

include FileUtils

def run archive_path, paths, type
  puts "Deleting #{archive_path}"
  rm_f archive_path
  if File.exists?(archive_path)
    puts "Failed to delete #{archive_path}.  Exiting."
    exit
  else
    puts "Successfully deleted #{archive_path}"
  end

  UtilityPack::SevenZip.send(type, archive_path, paths) 
  puts "Size of #{archive_path} is #{File.stat(archive_path).size/(1024.0*1024.0)} MB"
end

paths = [["c:\\temp\\ifb"], "C:\\Program Files\\7-Zip"]

# create regular zip file
run "c:\\temp\\a.zip", paths, :zip

# create self extracting file
run "c:\\temp\\a.exe", paths, :sfx

