module Integrity
  class CommandRunner
    class Error < StandardError; end

    Result = Struct.new(:success, :output)

    def initialize(logger)
      @logger = logger
    end

    def cd(dir)
      @dir = dir
      yield self
    ensure
      @dir = nil
    end

    def run(command)
      cmd = normalize(command)

      @logger.debug(cmd)

      output = ""
      @logger.info "Running in dir #{@dir} and it contains:"
      @logger.info `cd #{@dir} && pwd && ls -l`
      IO.popen(cmd, "r") { |io| output = io.read }

      Result.new($?.success?, output.chomp)
    end

    def run!(command)
      result = run(command)

      unless result.success
        @logger.error(output.inspect)
        raise Error, "Failed to run '#{command}'"
      end

      result
    end

    def normalize(cmd)
      if @dir
        "(cd #{@dir} && #{cmd} 2>&1)"
      else
        "(#{cmd} 2>&1)"
      end
    end
  end
end
