# docker_compose #

Puppet module for downloading and installing Docker Compose 
(https://docs.docker.com/compose/install/).

## Support

This module is currently tested on:

* Ubuntu 15.04
* CentOS 7.1

It may work on other distros...

## Usage

The module includes a single class:

```puppet
include 'docker_compose'
```

```puppet
class { 'docker_compose': }
```

## Test Install
`which docker-compose; docker-compose --version`
