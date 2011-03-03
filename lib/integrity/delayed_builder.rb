require "delayed_job"

module Integrity
  class DelayedBuilder
    def initialize(options)
      Delayed::Job.class_eval {
        def logger
          @_logger ||= Integrity.logger
        end
      }
    end

    def enqueue(build)
      Delayed::Job.enqueue(BuildJob.new(build))
    end

    class BuildJob
      def initialize(build)
        @build = build.id
      end

      def perform
        Build.get!(@build).run!
      end
    end
  end
end
