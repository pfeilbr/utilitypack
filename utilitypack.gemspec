# get version info from source file
$:.unshift(File.join(File.dirname(__FILE__), 'lib'))
require 'utility_pack/version'

PKG_NAME = "utilitypack"
PKG_VERSION = UtilityPack::VERSION::STRING

Gem::Specification.new do |s|
    s.name = PKG_NAME
    s.version = PKG_VERSION
    s.platform = Gem::Platform::RUBY
    s.has_rdoc = true
    s.extra_rdoc_files = ["README", "CHANGELOG", "COPYING"]
    s.rdoc_options = RDOC_OPTS
    s.summary = "A library of common utilities for ruby"
    s.description = s.summary
    s.author = "Brian Pfeil"
    s.email = ''
    s.homepage = ''
    s.required_ruby_version = '>= 1.8.2'
    s.files = %w(COPYING README Rakefile) +
      Dir.glob("{bin,doc,test,lib,examples,extras,share,contrib}/**/*") + 
      Dir.glob("ext/**/*.{h,c,rb}") +
      Dir.glob("examples/**/*.rb") +
      Dir.glob("tools/*.rb")
    s.require_path = "lib"
    s.bindir = "bin"
end
