# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pg_drive_backup/version'

Gem::Specification.new do |spec|
  spec.name          = 'pg_drive_backup'
  spec.version       = PgDriveBackup::VERSION
  spec.authors       = ['Kirill Shevchenko']
  spec.email         = ['hello@kirillshevch.com']

  spec.summary       = 'PostgreSQL backups with ccrypt to Google Drive API'
  spec.description   = 'Simple solution to make encrypted with ccrypt PostgreSQL backups with storing on Google Drive API'
  spec.homepage      = 'https://github.com/kirillshevch/pg_drive_backup'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'google_drive', '>= 2.1.6', '< 3.1.0'
  spec.add_dependency 'dry-configurable', '~> 0.7'

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rspec', '~> 3.6'
  spec.add_development_dependency 'byebug', '~> 11.0.1'
  spec.add_development_dependency 'rubocop', '~> 0.87.1'
end
