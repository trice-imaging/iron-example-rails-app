task environment_worker_options: :environment do
  @worker_options = {
    min_priority: ENV['MIN_PRIORITY'],
    max_priority: ENV['MAX_PRIORITY'],
    queues: ENV['QUEUES'].split(','),
    quiet: false
  }

  @worker_options[:sleep_delay] = ENV['SLEEP_DELAY'].to_i if ENV['SLEEP_DELAY']
  @worker_options[:read_ahead] = ENV['READ_AHEAD'].to_i if ENV['READ_AHEAD']
end

desc 'runs background workers'
task workers: :environment_worker_options do
  workers = []

  2.times do |i|
    workers << fork do
      $0 = "worker.#{i}"
      Delayed::Worker.new(@worker_options).start
    end
  end

  %w(INT SIGTERM).each do |sig|
    Signal.trap(sig) { workers.each { |w| Process.kill('INT', w) }  }
  end

  until workers.empty?
    dead_guys = Process.waitall
    dead_guys.each do |pid, _status|
      workers.delete(pid)
      Rails.logger.info "[Worker(host:#{Socket.gethostname} pid:#{pid})] exited"
    end
  end
end
