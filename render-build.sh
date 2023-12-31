# exit on error
set -o errexit

bundle config set force_ruby_platform true # https://stackoverflow.com/a/66311533
bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails db:migrate
bundle exec rails db:seed
