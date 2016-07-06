# Class: docker_compose::params
#
# This module manages docker_compose
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class docker_compose::params {
  # Some environments require /tmp to be noexec, so
  # docker needs its own temporary file store.
  $docker_tmp          = undef
  $version             = '1.5.2'
  $docker_compose_path = '/usr/local/bin'
  Exec {
    path => ['/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/'] }
}
