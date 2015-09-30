class squid::install{

  file {
    "${::squid::params::src_dir}/${::squid::tarball}":
      ensure => 'present',
      source => "puppet:///modules/squid/${::squid::tarball}",
      owner  => 'root',
      group  => 'root',
      mode   => '0600',
      notify => Exec['untar'];
  }

  exec {
    'untar':
      command     => "tar -xzf ${::squid::tarball}",
      cwd         => "${::squid::params::src_dir}",
      refreshonly => true,
      path        => "/bin",
      notify => Exec['configure-make'];
  }

  exec {
    'configure-make':
      command     => "./configure && make && make install",
      cwd         => "${::squid::squiddir}",
      refreshonly => true,
      provider    => 'shell',
  }

}
