class php
{
  exec { 'php55 rpm install':
    command => '/bin/rpm -Uvh http://mirror.webtatic.com/yum/el6/latest.rpm',
    creates => '/etc/yum.repos.d/webtatic.repo',
    logoutput => true,
  }

  package { 'php55w':
    ensure => installed,
    require => Exec['php55 rpm install'],
  }

  package { 'php55w-pdo':
    ensure => installed,
    require => Exec['php55 rpm install'],
  }

  package { 'php55w-cli':
    ensure => installed,
    require => Exec['php55 rpm install'],
  }

  package { 'php55w-pecl-xdebug':
    ensure => installed,
    require => Exec['php55 rpm install'],
  }

  package { 'php55w-common':
    ensure => installed,
    require => Exec['php55 rpm install'],
  }

  package { 'php55w-pgsql':
    ensure => installed,
    require => Exec['php55 rpm install'],
  }

  package { 'php55w-intl':
    ensure => installed,
    require => Exec['php55 rpm install'],
  }

  package { 'php55w-mcrypt':
    ensure => installed,
    require => Exec['php55 rpm install'],
  }

  package { 'php55w-xml':
    ensure => installed,
    require => Exec['php55 rpm install'],
  }

  file { 'php date.ini':
    path => '/etc/php.d/date.ini',
    content => 'date.timezone = America/Denver',
    mode => 0644,
    require => Package['php55w'],
  }

  file { 'php xdebug.ini':
    path => '/etc/php.d/xdebug.ini',
    mode => 0644,
    source => 'puppet:///modules/php/xdebug.ini',
    require => Package['php55w-pecl-xdebug'],
    owner => 'root',
    group => 'root',
    notify => Service['httpd'],
  }

  file { 'php display_errors.ini':
    path => '/etc/php.d/display_errors.ini',
    require => Package['php55w'],
    mode => 0644,
    owner => 'root',
    group => 'root',
    notify => Service['httpd'],
    content => 'display_errors = On',
  }
}
