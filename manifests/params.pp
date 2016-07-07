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
<<<<<<< HEAD
class docker_compose::params ($version = '1.5.2') {
=======
class docker_compose::params {
  # Some environments require /tmp to be noexec, so
  # docker needs its own temporary file store.
  $docker_tmp          = undef
  $version             = '1.5.2'
  $docker_compose_path = '/usr/local/bin'
>>>>>>> 1395540ba00c6772f6c2be1d600244533a77a02e
  Exec {
    path => ['/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/'] }
}
