require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc "Updates CHANGELOG.md"
task :changelog do
  `git-chglog -o CHANGELOG.md`
end

task :reload_version do
  load "lib/sugod/version.rb"
end

desc "Bumps version"
task :bump, [:type] do |t, args|
  result = `bundle exec gem bump #{args.type}`
  puts result
end

task :release => [:changelog, :reload_vesion]

desc "Bump version and then release"
task :submit, [:bump_type] do |t, args|
  Rake::Task["bump"].invoke(args.bump_type)
  `bundle exec rake `
  Rake::Task["reload_version"].invoke()
  puts Sugod::VERSION
  # Rake::Task["release"].invoke()
end
