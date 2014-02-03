class pgsql($host_ip)
{
  exec { 'postgres rpm install':
    command => '/bin/rpm -Uvh http://yum.postgresql.org/9.3/redhat/rhel-6-x86_64/pgdg-centos93-9.3-1.noarch.rpm',
    creates => '/etc/yum.repos.d/pgdg-93-centos.repo',
    logoutput => true,
  }
  ->
  user { 'postgres':
    ensure           => 'present',
    comment          => 'PostgreSQL Server',
    home             => '/var/lib/pgsql',
    password         => '!!',
    password_max_age => '-1',
    password_min_age => '-1',
    shell            => '/bin/bash',
  }
  ->
  file { '/var/log/db_deploy':
    ensure => 'directory',
    mode => 0644,
    owner => 'postgres',
    group => 'postgres',
  }
  ->
  file { 'postgres .hgrc':
    path => '/var/lib/pgsql/.hgrc',
    source => 'puppet:///modules/pgsql/postgres_hgrc',
    owner => 'postgres',
    group => 'postgres',
    mode => 0644,
  }
  ->
  file { ['/data', '/data/data', '/data/index']:
    ensure => 'directory',
    owner => 'postgres',
    group => 'postgres',
  }

  $psql = [
    'postgresql93-server',
    'postgresql93',
    'postgresql93-plperl',
    'postgresql93-plpython',
    'postgresql93-pltcl',
    'postgresql93-contrib',
    'postgresql93-libs'
  ]

  package { $psql:
    ensure => installed,
    require => Exec['postgres rpm install'],
  }

  exec { 'pgsql initdb':
    command => '/etc/init.d/postgresql-9.3 initdb',
    logoutput => true,
    creates => '/var/lib/pgsql/9.3/data/postgresql.conf',
    require => Package['postgresql93-server'],
  }
  ->
  class { 'configure':
    host_ip => $host_ip,
  }
  ->
  service { 'postgresql-9.3':
    ensure => running,
    enable => true,
    require => Exec['pgsql initdb'],
  }
}
