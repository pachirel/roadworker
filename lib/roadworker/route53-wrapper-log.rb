module Roadworker
  class Route53Wrapper
    module Log

      def log(level, message, color, log_id = nil)
        if log_id
          message = "#{log_id}: #{message}"
        elsif block_given?
          log_id = yield
          message = "#{log_id}: #{message}"
        end

        message << ' (dry-run)' if @options.dry_run
        @options.logger.send(level, message.send(color))
      end

    end # Log
  end # Route53Wrapper
end # Roadworker