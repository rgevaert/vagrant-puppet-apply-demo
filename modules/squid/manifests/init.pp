class squid ($version  = $squid::params::version) inherits squid::params {

  $tarball  = "squid-${squid::version}.tar.gz"
  $squiddir = "${::squid::params::src_dir}/squid-${squid::version}"

  class {
    '::squid::install':;
  }~>

  class {
    '::squid::config':;
  }~>

  class {
    '::squid::service':;
  }

}
