# devise_zxcvbn

[![Gem Version](https://badge.fury.io/rb/devise_zxcvbn.png)](http://badge.fury.io/rb/devise_zxcvbn)

Plugin for [devise](https://github.com/plataformatec/devise) to reject weak passwords, using [zxcvbn-ruby](https://github.com/envato/zxcvbn-ruby) which is a ruby port of [zxcvbn: realistic password strength estimation](https://tech.dropbox.com/2012/04/zxcvbn-realistic-password-strength-estimation/).
The user's password will be rejected if the score is below 4 by default. It also uses the email as user input to zxcvbn, to downscore passwords containing the email.

The scores 0, 1, 2, 3 or 4 are given when the estimated crack time (seconds) is less than `10**2`, `10**4`, `10**6`, `10**8`, Infinity.

## Installation

Add this line to your application's Gemfile:

    gem 'devise_zxcvbn'


## Devise Configuration

    class User < ActiveRecord::Base
      devise :database_authenticatable, :validatable, :zxcvbnable
    end

### Default parameters

A score of less than 3 is not recommended.

    # config/initializers/devise.rb
    Devise.setup do |config|
      config.min_password_score = 4
    end

### Error Message

Example error message, the `score` and `min_password_score` variables are also passed through if you need them.

    # config/locales/devise.en.yml
    en:
      errors:
        messages:
          weak_password: "not strong enough. Consider adding a number, symbols or more letters to make it stronger."


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
