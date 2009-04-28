$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

# NOTE: order of requires is important
%w( core process shell file ).each { |f| require "utility_pack/win32/#{f}_helpers" }