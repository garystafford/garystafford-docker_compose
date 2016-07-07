# Class: docker_compose
#
# This module installs Docker Compose
#
# Parameters:
#
# [*version*]
#   The version of Docker Compose to be installed. Default is 1.5.2.
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#   include 'docker_compose'
#   class { 'docker_compose': }
#   class { 'docker_compose':
#     version => '1.5.2'
#   }
#
class docker_compose ($version = $docker_compose::params::version) inherits 
docker_compose::params {
  # package { 'curl': ensure => 'installed' }

  exec { 'download-docker-compose':
    command => "curl -L https://github.com/docker/compose/releases/download/${version}/docker-compose-`uname -s`-`uname -m` > /tmp/docker-compose",
    user    => root,
    creates => '/tmp/bin/docker-compose'
  } ->
  exec { 'move-docker-compose':
    command => 'mv /tmp/docker-compose /usr/local/bin',
    user    => root
  } ->
  file { '/usr/local/bin/docker-compose':
    path  => '/usr/local/bin/docker-compose',
    owner => 'root',
    group => 'root',
    mode  => '0775',
  }
}
