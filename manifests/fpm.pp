class php::fpm (
  $config_file             = $php::params::fpm_config_file,
  $include_dir             = $php::params::fpm_config_include_dir,
  $purge_conf_dir          = $php::params::fpm_purge_conf_dir,
  $log_dir                 = $php::params::fpm_log_dir,
  $package_manage          = $php::params::fpm_package_manage,
  $package_ensure          = $php::params::fpm_package_ensure,
  $package_name            = $php::params::fpm_package_name,
  $config_manage           = $php::params::fpm_config_manage,
) inherits php::params {
  
  include '::php::fpm::install'
  include '::php::fpm::config'
  
  anchor { 'php::fpm::start': }
  anchor { 'php::fpm::end': }
  
  Anchor['php::fpm::start'] ->
  Class['php::fpm::install'] ->
  Class['php::fpm::config'] ->
  Anchor['php::fpm::end']
}
