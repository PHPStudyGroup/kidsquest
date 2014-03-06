class configure($host_ip)
{
  file {'pg_hba.conf':
    content => template('pgsql/pg_hba.conf.erb'),
    ensure => file,
    path => '/var/lib/pgsql/9.3/data/pg_hba.conf',
    mode => 0600,
    owner => 'postgres',
    group => 'postgres',
  }

  file {'postgresql.conf':
    source => 'puppet:///modules/pgsql/postgresql.conf',
    ensure => file,
    path => '/var/lib/pgsql/9.3/data/postgresql.conf',
    mode => 0600,
    owner => 'postgres',
    group => 'postgres',
  }
}
