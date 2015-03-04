class Status < ActiveRecord::Base
  after_create :enqueue

  def enqueue
    TestJob.set(wait: delay).perform_later(options)
  end

  def options
    { status_id: id, should_fail: should_fail }
  end
end
