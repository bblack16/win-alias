module WinAlias
  [:debug, :info, :warn, :error, :fatal].each do |severity|
    define_singleton_method(severity) do |message|
      BBLib.logger.send(severity, message)
    end
  end

  def self.success(message)
    info(BBLib::Console.colorize(message, :light_green))
  end

  def self.path
    ENV['WIN_ALIAS_HOME'] || File.join(Dir.home, 'win_alias', 'bin')
  end

  def self.in_path?
    ENV['PATH'].include?(path)
  end

  def self.add_to_path
    return true if in_path?
    # ENV['PATH'] = ENV['PATH'] + ";#{path}"
    # warn("About to set PATH to #{ENV['PATH']}")
    # `setx /M PATH "#{ENV['PATH']}"`
    warn("Your path is currently missing the bin dir for WinAlias. Please add it:")
    info("\t" + path)
  end
end
