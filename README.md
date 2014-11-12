# ValidatesNotShouting [![Build Status](https://travis-ci.org/avvo/validates_not_shouting.png)](https://travis-ci.org/avvo/validates_not_shouting) [![Code Climate](https://codeclimate.com/github/avvo/validates_not_shouting.png)](https://codeclimate.com/github/avvo/validates_not_shouting) [![Code Coverage](https://codeclimate.com/github/avvo/validates_not_shouting/coverage.png)](https://codeclimate.com/github/avvo/validates_not_shouting)

To prevent noobs from being uber noobs.

Originally idea conceived by [bvandenbos](https://github.com/bvandenbos). ActiveModel::Validator
to prevent the percentage of capital letters.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'validates_not_shouting'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install validates_not_shouting

## Usage

```

class Foo
  include ActiveModel::Validations
  attr_accessor :foo

  validates :foo, not_shouting: true
end

```

## Configuration

You can set the message and threshold as configuration for the validator. The default threshold is 0.5 (half of the characters).

    validates :foo, not_shouting: {threshold: 0.1, message: 'cannot be so shouty.'}

## Contributing

1. Fork it ( https://github.com/avvo/validates_not_shouting/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
