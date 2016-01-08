#web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb
#worker:  bundle exec rake jobs:work
web: bundle exec puma -p 5000 ./config.ru
actioncable: bundle exec puma -p 28080  cable/config.ru

