class php::fpm (
  $package_manage          = $php::params::fpm_package_manage,
  $package_ensure          = $php::params::fpm_package_ensure,
  $package_name            = $php::params::fpm_package_name,
) inherits php::params {
  
  include '::php::fpm::install'
  
  anchor { 'php::fpm::start': }
  anchor { 'php::fpm::end': }
  
  Anchor['php::fpm::start'] ->
  Class['php::fpm::install'] ->

  Anchor['php::fpm::end']
}
