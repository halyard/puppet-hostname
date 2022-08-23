require 'puppet_blacksmith/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'
require 'puppet-syntax/tasks/puppet-syntax'
require 'metadata-json-lint/rake_task'

PuppetLint::RakeTask.new(:lint) do |config|
  config.fail_on_warnings = true
  config.relative = true
  config.ignore_paths = ['vendor/**/*', 'pkg/**/*']
end

PuppetSyntax.exclude_paths = ["vendor/**/*"]

Blacksmith::RakeTask.new do |t|
  t.tag_pattern = '%s'
end

desc 'Release a new version of the puppet module'
deps = %i[module:clean test module:build module:push module:bump_commit]
task :release => deps do
  puts 'Pushing to remote git repo'
  Blacksmith::Git.new.push!
end

desc 'Run syntax and lint checks'
task test: [
  :metadata_lint,
  :syntax,
  :lint
]

task default: [:test]
