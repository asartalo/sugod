require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc "Updates CHANGELOG.md"
task :changelog do
  `git-chglog -o CHANGELOG.md`
end

task :reload_version do
  warn_level = $VERBOSE
  $VERBOSE = nil
  load "lib/sugod/version.rb"
  $VERBOSE = warn_level
end

desc "Bumps version"
task :bump, [:type] do |t, args|
  result = `bundle exec gem bump #{args.type}`
  if $?.success?
    puts "Successfully bumped version"
  else
    abort result
  end
end

task :release => [:changelog, :reload_vesion]

desc "Bump version and then release"
task :submit, [:bump_type] do |t, args|
  Rake::Task["bump"].invoke(args.bump_type)
  puts Sugod::VERSION
  Rake::Task["release"].invoke()
end
