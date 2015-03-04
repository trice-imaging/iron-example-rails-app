# Iron IO + Delayed Job

``` sh
bundle install && rake db:migrate
```

``` sh
rails s
```

``` sh
rake jobs:work
```

Add ```iron.json``` to root.
``` json
{
  "project_id": "XXX",
  "token": "XXX",
  "port": 443,
  "protocol": "https",
  "host":"mq-v3-worker-1.iron.io"
}
```

Visit [http://localhost:3000/statuses](http://localhost:3000/statuses)

## What isn't working

- create a new status with a delay.  The job is ran with no delay.
- create a new status with a should fail, job is ran 5 times with no
  delay.  Job is not put onto an error queue. Job can be tried more than
  five times when worker process restarts.
- hud-e.iron.io does not list any of the queues or jobs







