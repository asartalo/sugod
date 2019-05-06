require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc "Updates CHANGELOG.md"
task :changelog do
  `git-chglog -o CHANGELOG.md`
end

desc "Bumps version"
task :bump, [:type] do |t, args|
  `bundle exec gem bump #{args.type}`
end

task :release => [:changelog]

desc "Bump version and then release"
task :submit, [:bump_type] do |t, args|
  Rake::Task["bump"].invoke(args.bump_type)
  Rake::Task["release"].invoke()
end
