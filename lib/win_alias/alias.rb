module WinAlias
  class Alias
    include BBLib::Effortless

    attr_str :name, required: true, arg_at: 0
    attr_str :command, required: true, arg_at: 1
    attr_bool :temp, default: false
    attr_bool :echo_off, default: true

    def self.delete!(name)
      path = File.join(WinAlias.path, "#{name}.bat")
      return true unless File.exist?(path)
      FileUtils.rm(path)
      !File.exist?(path)
    end

    def self.list
      BBLib.scan_dir(WinAlias.path, '*.bat').map { |f| f.file_name(false) }.sort
    end

    def path
      File.join(WinAlias.path, "#{name}.bat")
    end

    def build_command
      (echo_off? ? "@ECHO OFF\n" : '') + command
    end

    def save
      build_command.to_file(path, mode: 'w')
    end

  end
end
