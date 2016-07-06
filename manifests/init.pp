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
#   class { 'docker_compose':
#     version => '1.4.0'
#   }
#
class docker_compose (
  $version    = $docker_compose::params::version,
  $docker_tmp = $docker_compose::params::docker_tmp,
) inherits docker_compose::params {
  # package { 'curl': ensure => 'installed' }
  if $docker_tmp != undef {
    $docker_version_cmd = "TMP=${docker_tmp} /usr/local/bin/docker-compose --version"
  }
  else {
    $docker_version_cmd = '/usr/local/bin/docker-compose --version'
  }
  exec { 'download-docker-compose':
    command => "curl -L https://github.com/docker/compose/releases/download/${version}/docker-compose-`uname -s`-`uname -m` > /tmp/docker-compose",
    user    => root,
    creates => '/tmp/bin/docker-compose',
    unless  => "[ $(${docker_version_cmd} | cut -d\",\" -f1 | cut -d\" \" -f3) = \"${version}\" ]",
  } ->
  exec { 'move-docker-compose':
    command => 'mv /tmp/docker-compose /usr/local/bin',
    user    => root,
    creates => '/usr/local/bin/docker-compose'
  } ->
  file { '/usr/local/bin/docker-compose':
    path  => '/usr/local/bin/docker-compose',
    owner => 'root',
    group => 'root',
    mode  => '0775',
  }
}
