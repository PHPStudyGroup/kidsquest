class application
{
    file { 'config/autoload/local.ini':
        path   => '/vagrant/config/autoload/local.php',
        source => '/vagrant/config/autoload/local.php.dist',
        mode   => 0644,
    }
}
