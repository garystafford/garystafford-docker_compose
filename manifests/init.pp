# Class: docker_compose
#
# This module installs Docker Compose
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#   include 'docker_compose'
#   class { 'docker_compose': }
#
class docker_compose {
  include apt

  package { 'curl': ensure => 'installed' }

  Exec {
    path => ['/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/'] }

  exec { 'download-docker-compose':
    command => 'curl -L https://github.com/docker/compose/releases/download/VERSION_NUM/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose',
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
