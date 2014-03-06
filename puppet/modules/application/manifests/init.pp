class application
{
    file { 'config/autoload/local.ini':
        path   => '/vagrant/config/autoload/local.php',
        source => '/vagrant/config/autoload/local.php.dist',
        mode   => 0644,
    }
    ->
    exec { 'make database':
      command   => 'psql -U postgres postgres -f make_database.sql',
      cwd       => '/vagrant/scripts',
      path      => '/usr/bin:/usr/sbin',
      logoutput => true,
    }
}
