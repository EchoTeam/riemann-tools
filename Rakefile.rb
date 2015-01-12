require 'rubygems'
require 'rubygems/package_task'
#require 'rdoc/task'
require 'find'

# Don't include resource forks in tarballs on Mac OS X.
ENV['COPY_EXTENDED_ATTRIBUTES_DISABLE'] = 'true'
ENV['COPYFILE_DISABLE'] = 'true'

# Gemspec
gemspec = Gem::Specification.new do |s|
  s.name = 'echo-riemann-postgres-tool'
  s.version = '0.1.9'
  s.author = 'Kyle Kingsbury'
  s.email = 'aphyr@aphyr.com'
  s.homepage = 'https://github.com/EchoTeam/riemann-tools'
  s.platform = Gem::Platform::RUBY
  s.summary = 'Utilities which submit events to Riemann.'


  s.add_dependency 'trollop', '2.0'
  s.add_dependency 'beefcake', '0.5.0'
  s.add_dependency 'riemann-client', '0.2.3'
  s.add_dependency 'pg', '0.17.1'


  s.files = FileList['lib/**/*', 'bin/*', 'LICENSE', 'README.markdown'].to_a
  s.executables |= Dir.entries('bin/')
  s.require_path = 'lib'
  s.has_rdoc = true

  s.required_ruby_version = '>= 1.8.7'
end

Gem::PackageTask.new gemspec do |p|
end

