define php::fpm_instance (
  $ensure                      = 'present',
  $override_options            = {},
) {
  
  include '::php::params'
  
  $fpm_config_include_dir = $php::params::fpm_config_include_dir
  $fpm_options_default_instance = $php::params::fpm_options_default_instance
  
  $config_filename = "${fpm_config_include_dir}/${name}.conf"
  $options = php_deepmerge($fpm_options_default_instance, $override_options)
  
  file { $config_filename:
    ensure  => $ensure,
    path    => "${config_filename}",
    content => template('php/fpm-instance.conf.erb'),
  }
}
