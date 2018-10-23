module WinAlias
  [:debug, :info, :warn, :error, :fatal].each do |severity|
    define_singleton_method(severity) do |message|
      BBLib.logger.send(severity, message)
    end
  end


  def self.success(message)
    info(BBLib::Console.colorize(message, :light_green))
  end

  def self.base_path
    ENV['WIN_ALIAS_HOME'] || File.join(Dir.home, 'win_alias')
  end

  def self.path
    File.join(base_path, 'bin')
  end

  def self.in_path?
    ENV['PATH'].include?(path)
  end

  def self.add_to_path
    return true if in_path?
    warn("About to add win-alias/bin to PATH. A backup of your paths will be saved @ #{File.join(base_path, 'path_backup.txt')} in case something goes wrong.")
    error("NOTE: It is recommdned you verify your PATH in another shell after this is run. Some versions of Windows can cause the PATH to be truncated at 1024 characters.")
    backup_path_variable
    ENV['PATH'] = ENV['PATH'] + ";#{path}"
    `setx /M PATH "#{ENV['PATH']}"`
    in_path?
  end

  def self.backup_path_variable
    backup = File.join(base_path, 'path_backup.txt')
    lines = File.exist?(backup) ? File.read(backup).split("\n") : []
    lines += ENV['PATH'].split(';')
    lines.uniq.join("\n").to_file(backup, mode: 'w')
  end
end
