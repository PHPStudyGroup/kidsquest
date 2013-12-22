# Runs all this stuff as root

include httpd
include php
include application
include profile
include git
class { 'composer':
    require => Class['php'],
}
