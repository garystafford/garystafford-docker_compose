# Class: docker_compose
#
# This module installs Docker Compose
#
# Parameters:
#
# [*version*]
#   The version of Docker Compose to be installed. Default is 1.4.0.
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#   include 'docker_compose'
#   class { 'docker_compose': }
#
class docker_compose ($version = $docker_compose::params::version) {
  package { 'curl': ensure => 'installed' }

  exec { 'download-docker-compose':
    command => 'curl -L https://github.com/docker/compose/releases/download/${version}/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose',
    user    => root,
    onlyif  => 'test ! -f /usr/local/bin/docker-compose'
  } ->
  file { '/usr/local/bin/docker-compose':
    path  => '/usr/local/bin/docker-compose',
    owner => 'root',
    group => 'root',
    mode  => '0755',
  }

}
