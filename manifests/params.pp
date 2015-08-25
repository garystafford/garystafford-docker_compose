# Class: sakila_mysql_db::params
#
# This module manages sakila_mysql_db
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class docker_compose::params ($version = '1.4.0') {
  Exec {
    path => ['/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/'] }
}
