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
class docker_compose (
  $version             = $docker_compose::params::version,
  $docker_tmp          = $docker_compose::params::docker_tmp,
  $docker_compose_path = $docker_compose::params::docker_compose_path,
) inherits docker_compose::params {
  # package { 'curl': ensure => 'installed' }
  if $docker_tmp != undef {
    $docker_version_cmd = "TMP=${docker_tmp} ${docker_compose_path}/docker-compose --version"
  }
  else {
    $docker_version_cmd = "${docker_compose_path}/docker-compose --version"
  }
  exec { 'download-docker-compose':
    command => "curl -L https://github.com/docker/compose/releases/download/${version}/docker-compose-`uname -s`-`uname -m` > /tmp/docker-compose",
    user    => root,
    creates => '/tmp/bin/docker-compose',
    unless  => "[ $(${docker_version_cmd} | cut -d\",\" -f1 | cut -d\" \" -f3) = \"${version}\" ]",
  } ->
  exec { 'move-docker-compose':
    command => "mv /tmp/docker-compose ${docker_compose_path}",
    user    => root,
    creates => "${docker_compose_path}/docker-compose"
  } ->
  file { "${docker_compose_path}/docker-compose":
    path  => "${docker_compose_path}/docker-compose",
    owner => 'root',
    group => 'root',
    mode  => '0755',
  }
}
