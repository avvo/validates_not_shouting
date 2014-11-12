source 'https://rubygems.org'

# Specify your gem's dependencies in validates_not_shouting.gemspec
gemspec

am_version = ENV["AM_VERSION"] || "default"

am_version = case am_version
when "default"
  ">= 3.2.0"
else
  "~> #{am_version}"
end

gem "activesupport", am_version

gem "codeclimate-test-reporter", group: :test, require: nil