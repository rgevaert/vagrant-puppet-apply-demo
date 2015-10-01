node default {
#  include squid

  file {
    '/var/tmp/squid_3.5.9_amd64.deb':
      ensure => present,
      source => 'puppet:///modules/squid/squid_3.5.9_amd64.deb';
  }

  # fpm -s dir -t deb -n squid -v 3.5.9 /usr/local/squid
  package {
    'squid':
      ensure   => installed,
      require => File['/var/tmp/squid_3.5.9_amd64.deb'],
      provider => dpkg,
      source   => '/var/tmp/squid_3.5.9_amd64.deb';
  }

}
