class composer {
    exec { 'Install Composer':
        command   => 'curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin',
        path      => '/usr/bin:/usr/sbin',
        creates   => '/usr/local/bin/composer.phar',
        require   => Package['php55w-cli'],
        logoutput => true,
    }
    ->
    exec { '/usr/local/bin/composer.phar selfupdate':
        logoutput   => true,
        environment => 'COMPOSER_HOME=/usr/local/bin',
    }
    ->
    exec { 'composer install':
        command => '/usr/local/bin/composer.phar install -vvv',
        path    => '/usr/bin:/usr/sbin:/usr/local/bin',
        creates => '/vagrant/vendor',
        cwd     => '/vagrant',
        logoutput => true,
        environment => [
            'COMPOSER_HOME=/usr/local/bin',
        ],
    }
}
