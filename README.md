# Description
This repo is forked from odarriba/docker-timemachine.
It is only used for my home environment.

# Example Docker Compose config
I set a low mem_limit value because linux file cache.

```
timemachine:
  build: timemachine
  net: host
  volumes:
    - /mnt/storage:/storage
    - /mnt/timemachine:/timemachine
  ports:
    - "548:548"
    - "636:636"
  mem_limit: 10m
  memswap_limit: -1
  restart: always  
  stdin_open: true
```

# License
[MIT License](http://axot.mit-license.org)