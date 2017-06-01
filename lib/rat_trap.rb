require "rat_trap/version"
require 'msgpack'
require 'json'

module RatTrap

  TEMP_DIR = "/tmp/rat_trap"
  TEMPFILE_TEMPLATE = "%s.unpacked"
  MSGPACK_FILE_EXT = /.bin/

  def self.run(args, options)
    file_idx = args.find_index { |arg| arg =~ MSGPACK_FILE_EXT }
    unless file_idx
      puts "please specify a MessagePack(bin) file"
      return
    end
    file = args[file_idx]
    args[file_idx] = '%s'
    cmd = args.join(" ")
    if unpack(file, options)
      tempfile = TEMPFILE_TEMPLATE % File.basename(file)
      path = temp_path(tempfile)
      system(cmd % path)
    end
  end

  def self.unpack_here(args, options = {})
    file_idx = args.find_index { |arg| arg =~ MSGPACK_FILE_EXT }
    unless file_idx
      puts "please specify a MessagePack(bin) file"
      return
    end
    file = args[file_idx]
    unpack(file, retain: true, here: true)
  end

  def unpack(file, options = {})
    unless File.exist?(file)
      puts "file doesn't exist"
      return
    end
    puts "force to unpack rat file" if options[:force]
    basename = File.basename(file)
    tempfile = TEMPFILE_TEMPLATE % basename
    # return true if File.exist?(tempfile) && !options[:force]
    path =
      if options[:here]
        tempfile
      else
        temp_path(tempfile)
      end
    File.open(path, "wb") do |f|
      rat = MessagePack.unpack(File.read(file))
      data =
        case rat
        when Hash
          rat.each do |k, v|
            if v.is_a? Array
              rat[k] = v.map do |row|
                row.to_s.gsub('"', '')
              end
            end
          end
          JSON.pretty_generate(rat)
        when Array
          pretty_print_array(rat)
        end
      f.write(data)
    end
  ensure
    FileUtils.rm_rf(tempfile) unless options[:retain]
  end

  def pretty_print_array(as)
    as.map(&:to_s).join("\n") + "\n"
  end

  def temp_path(file)
    FileUtils.mkdir_p(TEMP_DIR)
    File.join(TEMP_DIR, file)
  end

  def self.hello
    puts "hello world"
  end
end
