(bundle exec gem bump $1) && \
  VERSION=$(ruby -e "require './lib/sugod/version.rb'; puts Sugod::VERSION") && \
  (git-chglog --next-tag $VERSION -o CHANGELOG.md) && \
  (git commit -am "Release CHANGELOG") && \
  (bundle exec gem tag) && \
  (rake release)
