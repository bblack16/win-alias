# WinAlias

WinAlias provides a simple CLI tool to add aliases to your windows environment just like Unix using your PATH environment and batch scripts. This is in very early development and is not intended to do anything more advanced than what is advertised. It is purely for convenience..

## Installation

  $ gem install win_alias

## Usage

In order to use WinAlias, be sure to add the following path to your system or user path:

- `C:\Users\<UserName>\win-alias\bin`

Once the path is in your system you can add aliases and use them anywhere in cmd or any other Windows shell.

IMPORTANT NOTE: If you do not add the bin directory to your PATH youself, win-alias will attempt to add it the first time it runs. This may cause issues with PATHS over 1024 characters on older Windows versions. Be sure to check your PATH if you rely on the automatic adding of the bin path. Just in case, your original PATH variable will be backed up into `C:\Users\<UserName>\win-alias\path_backup.txt`

### Add alias

You can add aliases using any of the examples shown below. If your command includes flags, use the `-c` or `--cmd` argument followed by your command in quotes to avoid collisions with the flags win-alias expects.

```
# Alias dir to ls
win-alias ls dir

# Now run ls
ls

# Alias ll to "ls -l"
# Notice how --cmd is used to avoid win-alias treating -l as a flag to itself
win-alias ll --cmd "ls -l"

# Now run ll
ll
```

### Edit alias

You can also have win-alias open the generated script up into your systems text editor after it is created. This allows you to more easily generate much larger aliased scripts without having to rely entirely on passing the script in via the command line. To do this just add the __-e__ flag to the win-alias command.

Additionally it is possible to edit existing aliases easily via the CLI. To do this, use the following command: `win-alias <alias-name> -e`
NOTE: If you pass additional arguments the alias will be overwritten before being edited, so if you wish to edit only, please use -e only.

```
# Create an alias called ll and open it in a text editor after it is created
win-alias ll "ls -lh" -e

# Open an existing alias called ll for editing.
# win-alias ll -e
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
