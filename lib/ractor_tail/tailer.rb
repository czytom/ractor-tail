# frozen_string_literal: true

module RactorTail
  class Tailer
    def initialize(path, logger: nil, &block)
      @path = path
      @callback = block
      @logger = logger
    end

    def run
      loop do
        begin
          File.open(@path, "r") do |file|
            file.seek(0, IO::SEEK_END)
            current_inode = file.stat.ino

            loop do
              if (line = file.gets)
                @callback.call(line)
              else
                sleep 0.5
              end

              if File.exist?(@path) && File.stat(@path).ino != current_inode
                log "Detected logrotate for #{@path}"
                break
              end
            end
          end
        rescue => e
          log "Error reading #{@path}: #{e.message}"
          sleep 2
        end
      end
    end

    private

    def log(msg)
      return unless @logger
      @logger.info(msg)
    end
  end
end
