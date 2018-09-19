# WinAlias

WinAlias provides a simple CLI tool to add aliases to your windows environment just like Unix using your PATH environment and batch scripts. This is in very early development and is not intended to do anything more advanced than what is advertised. It is purely for convenience.

## Installation

  $ gem install win_alias

## Usage

Currently the code to have WinAlias add it's bin path to the system PATH is disabled due to character limits in older Windows systems. In order to use WinAlias, be sure to add the following path to your system or user path:

- C:\Users\< User Name >\win-alias\bin

Once the path is in your system you can add aliases and use them anywhere in cmd or any other Windows shell.

### Add aliases

```
# Alias dir to ls
win-alias ls dir

# Now run ls
ls

# Alias ll to "ls -lh"
win-alias ll --cmd "ls -lh"
```

### Delete alias

```
win-alias ll -d
```

### List aliases

```
win-alias -l
```

### Help

Run the win-alias command with no arguments to display the help menu

```
win-alias
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/win_alias. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the WinAlias project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/win_alias/blob/master/CODE_OF_CONDUCT.md).
