define php::fpm_instance (
  $ensure                      = 'present',
  $override_options            = {},
) {
  
  include '::php::params'
  
  $fpm_config_include_dir = $php::params::fpm_config_include_dir
  $fpm_log_dir = $php::params::fpm_log_dir
  $fpm_options_default_instance = $php::params::fpm_options_default_instance
  
  $config_filename = "${fpm_config_include_dir}/${name}.conf"
  
  $local_overrides = {
    'access.log'                => "${fpm_log_dir}/${name}_access.log",
    'slowlog'                   => "${fpm_log_dir}/${name}_slow.slow",
    'php_admin_value'           => {
      'error_log'               => "${fpm_log_dir}/${name}_error.log",
    }
  }

  $options = php_deepmerge($fpm_options_default_instance, $local_overrides, $override_options)
  
  file { $config_filename:
    ensure  => $ensure,
    path    => "${config_filename}",
    content => template('php/fpm-instance.conf.erb'),
  }
}
