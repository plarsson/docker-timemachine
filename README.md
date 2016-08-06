# Description
Forked from axot/docker-timemachine for private use

# Example Docker Compose config

```
timemachine:
  build: docker-timemachine
  net: host
  volumes:
    - /pool1/storage:/storage
    - /pool1/timemachine:/timemachine
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
