class php::fpm (
  $config_file             = $php::params::fpm_config_file,
  $include_dir             = $php::params::fpm_config_include_dir,
  $purge_conf_dir          = $php::params::fpm_purge_conf_dir,
  $log_dir                 = $php::params::fpm_log_dir,
  $var_dir             = $php::params::fpm_var_dir,
  $session_dir         = $php::params::fpm_session_dir,
  $override_options        = {},
  $package_manage          = $php::params::fpm_package_manage,
  $package_ensure          = $php::params::fpm_package_ensure,
  $package_name            = $php::params::fpm_package_name,
  $config_manage           = $php::params::fpm_config_manage,
  $service_manage          = $php::params::fpm_service_manage,
  $service_name            = $php::params::fpm_service_name,
  $service_enable          = $php::params::fpm_service_enable,
) inherits php::params {
  
  # Merge default_options and override_options into final options
  $options = php_deepmerge($php::params::fpm_options_default_global, $override_options)
  
  include '::php::fpm::install'
  include '::php::fpm::config'
  include '::php::fpm::instance_default'
  include '::php::fpm::service'
  
  anchor { 'php::fpm::start': }
  anchor { 'php::fpm::end': }
  
  Anchor['php::fpm::start'] ->
  Class['php::fpm::install'] ->
  Class['php::fpm::config'] ->
  Class['php::fpm::instance_default'] ->
  Class['php::fpm::service'] ->
  Anchor['php::fpm::end']
}
