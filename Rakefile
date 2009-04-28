require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rake/clean'
require 'rake/gempackagetask'

# get version info from source file
$:.unshift(File.join(File.dirname(__FILE__), 'lib'))
require 'utility_pack/version'

windows = (PLATFORM =~ /win32|cygwin/)
BAT = windows ? ".bat" : ""
SUDO = windows ? "" : "sudo"

PKG_NAME = "utilitypack"
PKG_VERSION = UtilityPack::VERSION::STRING
CLEAN.include ['*.gem', 'pkg/', 'doc/rdoc']
RDOC_OPTS = ['--quiet', '--title', "Utility Pack",
    "--opname", "index.html",
    "--line-numbers", 
    "--main", "README",
    "--inline-source"]

# Test Tasks ---------------------------------------------------------

desc "Run all tests"
task :test_all => [:test_units]
task :ta => [:test_all]

task :tu => [:test_units]

Rake::TestTask.new("test_units") do |t|
  t.test_files = FileList['test/test*.rb']
  t.verbose = false
end



desc "Packages up Utility Pack."
task :default => [:package]

desc "creates package"
task :package => [:clean]

desc "creates documentation"
task :doc => [:rdoc]

Rake::RDocTask.new do |rdoc|
    rdoc.rdoc_dir = 'doc/rdoc'
    rdoc.options += RDOC_OPTS
    rdoc.main = "README"
    rdoc.title = "Utility Pack"
    rdoc.rdoc_files.add ['README', 'CHANGELOG', 'COPYING', 'lib/**/*.rb']
end

spec =
    Gem::Specification.new do |s|
        s.name = PKG_NAME
        s.version = PKG_VERSION
        s.platform = Gem::Platform::RUBY
        s.has_rdoc = true
        s.extra_rdoc_files = ["README", "CHANGELOG", "COPYING"]
        s.rdoc_options = RDOC_OPTS
        s.summary = "Library of useful utilities"
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

Rake::GemPackageTask.new(spec) do |p|
    p.need_tar = false
    p.need_zip = false
    p.gem_spec = spec
end

desc "installs gem"
task :install => [:package] do
  sh %{#{SUDO} gem#{BAT} install pkg/#{PKG_NAME}-#{PKG_VERSION}}
end

desc "uninstalls gem"
task :uninstall => [:clean] do
  sh %{#{SUDO} gem#{BAT} uninstall #{PKG_NAME} -x}
end