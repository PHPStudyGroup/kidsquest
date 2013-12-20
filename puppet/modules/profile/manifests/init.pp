class profile
{
    file { '.bash_profile':
        source => 'puppet:///modules/profile/bash_profile',
        path => '/home/vagrant/.bash_profile',
        mode => 0644,
        owner => 'vagrant',
        group => 'vagrant',
    }
}