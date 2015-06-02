define php::fpm_instance (
  $ensure                      = 'present',
  $user                        = 'UNSET',
  $group                       = 'UNSET',
  $override_options            = {},
) {
  
  include '::php::params'
  
  $fpm_config_include_dir = $php::params::fpm_config_include_dir
  $fpm_log_dir = $php::params::fpm_log_dir
  $fpm_session_dir = $php::params::fpm_session_dir
  $fpm_options_default_instance = $php::params::fpm_options_default_instance
  
  $user_real = $user ? {
    'UNSET' => $::php::params::fpm_options_default_instance['user'],
    default => $user,
  }
  
  $group_real = $group ? {
    'UNSET' => $::php::params::fpm_options_default_instance['group'],
    default => group,
  }
  
  $config_filename = "${fpm_config_include_dir}/${name}.conf"
  $instance_session_dir = "${fpm_session_dir}/${name}"
  
  $local_overrides = {
    'user'                      => $user_real,
    'group'                     => $group_real,
    'access.log'                => "${fpm_log_dir}/${name}_access.log",
    'slowlog'                   => "${fpm_log_dir}/${name}_slow.slow",
    'php_admin_value'           => {
      'error_log'               => "${fpm_log_dir}/${name}_error.log",
    },
    'php_value'                 => {
      'session.save_path'       => $instance_session_dir,
    },
  }

  $options = php_deepmerge($fpm_options_default_instance, $local_overrides, $override_options)
  
  file { $instance_session_dir:
    ensure => directory,
    mode   => '0700',
    owner  => $user_real,
    group  => $group_real,
  }
  
  file { $config_filename:
    ensure  => $ensure,
    path    => $config_filename,
    content => template('php/fpm-instance.conf.erb'),
  }
}
