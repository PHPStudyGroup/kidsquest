# Runs all this stuff as root

include httpd
include php
class { 'pgsql':
  host_ip => $host_ip,
}
class { 'application':
  require => Class['pgsql'],
}
include profile
include git
class { 'composer':
    require => Class['php'],
}
