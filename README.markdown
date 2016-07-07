## Install Docker Compose

Puppet module for downloading and installing [Docker Compose](https://docs.docker.com/compose/install/).

#### Support

This module is currently tested on:

* Ubuntu 15.04
* CentOS 6.6, 7.1

It should also work on other Linux distros...

#### Usage
```puppet
include 'docker_compose'
```
```puppet
class { 'docker_compose': }
```
```puppet
class { 'docker_compose':
  version => '1.5.2'
}
```

#### Test Install
```sh
which docker-compose
```
should return: `/usr/local/bin/docker-compose'

```sh
docker-compose --version
```
should return: `docker-compose version: 1.5.2`
