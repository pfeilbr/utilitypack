PKG_NAME = "utilitypack"
PKG_VERSION = '0.1.4'
RDOC_OPTS = ['--quiet', '--title', "Utility Pack",
    "--opname", "index.html",
    "--line-numbers", 
    "--main", "README.textile",
    "--inline-source"]

Gem::Specification.new do |s|
    s.name = PKG_NAME
    s.version = PKG_VERSION
    s.platform = Gem::Platform::RUBY
    s.has_rdoc = true
    s.extra_rdoc_files = ["README.textile", "CHANGELOG", "COPYING"]
    s.rdoc_options = RDOC_OPTS
    s.summary = "A library of common utilities for ruby"
    s.description = s.summary
    s.author = "Brian Pfeil"
    s.email = ''
    s.homepage = ''
    s.required_ruby_version = '>= 1.8.2'
    s.files = %w(COPYING README.textile Rakefile) +
      Dir.glob("{bin,doc,test,lib,examples,extras,share,contrib}/**/*") + 
      Dir.glob("ext/**/*.{h,c,rb}") +
      Dir.glob("examples/**/*.rb") +
      Dir.glob("tools/*.rb")
    s.require_path = "lib"
    s.bindir = "bin"
end
