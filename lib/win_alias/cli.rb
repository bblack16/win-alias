require 'bblib'
require 'bblib/cli'

require_relative '../win_alias'

BBLib.color_logs = true
BBLib.logger.level = :debug if ARGV.include?('-v') || ARGV.include?('--verbose')
BBLib.logger.level = :fatal if ARGV.include?('-q') || ARGV.include?('--quiet')

BBLib.logger.formatter = proc do |severity, datetime, progname, msg|
  msg = msg.to_s.to_color(severity) if BBLib.color_logs && severity.to_s.downcase != 'info'
  if msg.is_a?(Exception)
    msg = msg.inspect + "\n\t" + msg.backtrace.join("\n\t")
  end
  "#{msg.to_s.chomp}\n"
end

module WinAlias
  parser = BBLib::OptsParser.new do |pars|
    pars.usage "Usage: win-alias <alias> [command...] [options...]\n\n\tCreate an alias: win-alias <alias> [command...]\n\tEdit an alias:   win-alias <alias> -e\n\tDelete an alias: win-alias <alias> -d\n"
    pars.string('-c', '--cmd', '--command', desc: 'The command to alias. If not provided, all unrecognized arguments are treated as the command.')
    pars.toggle('-d', '--delete', desc: 'Deletes the provided alias instead of creating one')
    pars.toggle('-l', '--list', desc: 'List all known aliases')
    pars.toggle('-y', '--yes-to-all', desc: 'Yes to any prompts. This is mostly useful to avoid the overwrite prompt if an alias already exists.')
    pars.command(position: 0, name: :alias)
    pars.toggle('-e', '--edit', desc: 'Open up the alias script in your text editor after it is created.')
    pars.untoggle('--echo', desc: 'Do not disable echo in the aliased command. By default it is enabled.')
  end

  opts = parser.parse
  add_to_path

  if opts[:delete]
    if Alias.delete!(opts.alias)
      info "All aliases matching #{opts.alias} have been removed."
    else
      warn "Failed to delete #{opts.alias}. Could be a permissions issue."
    end
  elsif opts.list? || opts.alias == '-l' || opts.alias == '--list'
    puts "\t- " + Alias.list.join("\n\t- ")
  elsif opts.alias.nil? || opts.alias == '-h' || opts.alias == '--help'
    puts parser.help
  elsif opts.edit? && (opts.cmd.nil? || opts.cmd.empty?) && opts.arguments.empty?
    BBLib::Console.edit_file(Alias.new(opts.alias, opts.cmd).path)
  else

    if Alias.list.include?(opts.alias) && !opts.yes_to_all?
      exit(2) unless BBLib::Console.confirm?("There is already an alias named #{opts.alias}. Do you want to overwrite it?")
    end

    if opts.cmd && opts.cmd.empty? || opts.cmd.nil?
      opts.cmd = opts.arguments.size == 1 ? opts.arguments.first : opts.arguments.map do |arg|
        arg.include?(' ') ? "\"#{arg.gsub('"', '\\"')}\"" : arg
      end.join(' ')
    end
    als = Alias.new(opts.alias, opts.cmd, echo_off: opts.echo)
    if als.save
      BBLib::Console.edit_file(als.path) if opts.edit?
      puts BBLib::Console.colorize("Created alias for #{opts.alias}", :light_green)
    end
  end
end
