class httpd
{
  package {'httpd':
    ensure => '2.2.15-29.el6.centos',
  }

  service {'httpd':
    ensure => running,
    enable => true,
    require => [
      Package['httpd'],
      Class['php'],
    ],
  }

  service {'iptables':
    ensure => stopped,
    enable => false
  }

  file {'kidsquest.vhost':
    path => '/etc/httpd/conf.d/05-kidsquest.conf',
    source => 'puppet:///modules/httpd/kidsquest.vhost',
    mode => 0644,
    owner => 'root',
    group => 'root',
    require => Package['httpd'],
    notify => Service['httpd'],
  }

  file {'/etc/httpd/conf.d/01-servername.conf':
    path => '/etc/httpd/conf.d/01-servername.conf',
    source => 'puppet:///modules/httpd/01-servername.conf',
    mode => 0644,
    owner => 'root',
    group => 'root',
    require => Package['httpd'],
    notify => Service['httpd'],
  }
}
