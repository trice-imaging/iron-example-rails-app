Delayed::Worker.destroy_failed_jobs = false

# Delayed::Worker.sleep_delay = 5
# Delayed::Worker.max_attempts = 5
# Delayed::Worker.max_run_time = 5.minutes
# Delayed::Worker.read_ahead = 10
# Delayed::Worker.default_queue_name = 'default'
# Delayed::Worker.delay_jobs = !Rails.env.test?
# Delayed::Worker.raise_signal_exceptions = :term
# Delayed::Worker.logger = Rails.logger

Delayed::IronMqBackend.available_priorities = [0,1] # Default is [0]. Please note, adding new priorities will slow down picking the next job from queue.  Also note that these priorities must include all priorities of your Delayed Jobs.
Delayed::IronMqBackend.delay = 0  # Time to wait before message will be available on the queue
Delayed::IronMqBackend.timeout = 5.minutes # The time in seconds to wait after message is taken off the queue, before it is put back on. Delete before :timeout to ensure it does not go back on the queue.
Delayed::IronMqBackend.expires_in = 7.days # After this time, message will be automatically removed from the queue.
Delayed::IronMqBackend.error_queue = 'error_queue' # The failed jobs will be placed into the error queue
Delayed::IronMqBackend.default_queue = 'default' # Specify a default queue name
Delayed::IronMqBackend.queues = ['default', 'uber'] # The queues that you want your job to run in. All queues should have been specified except default one.
