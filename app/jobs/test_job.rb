class TestJob < ActiveJob::Base
  # queue_as :uber

  def perform(options)
    status = Status.find(options.fetch('status_id'))

    sleep(61)

    status.update(runs: status.runs + 1)

    if options.fetch('should_fail')
      raise 'FAILING THE JOB!'
    end
  rescue => e
    logger.error e.message
    logger.error e.backtrace.join("\n")
    raise e
  end
end
