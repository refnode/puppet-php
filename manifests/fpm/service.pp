# PRIVATE CLASS: do not use directly
class php::fpm::service {

  if $php::fpm::service_manage {
    if $php::fpm::service_enable {
      $service_ensure = 'running'
    } else {
      $service_ensure = 'stopped'
    }
  } else {
    $service_ensure = undef
  }
  
  service { 'php-fpm':
    ensure  => $service_ensure,
    name    => $php::fpm::service_name,
    enable  => $php::fpm::service_enable,
    require => Package['php-fpm'],
  }
  
  # only establish ordering between config file and service if
  # we're managing the config file.
  if $php::fpm::config_manage {
    File['php-fpm-config-file'] -> Service['php-fpm']
  }
}
