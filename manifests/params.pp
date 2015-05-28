# PRIVATE CLASS: do not use directly
class php::params {
  $fpm_config_file             = '/etc/php-fpm.conf'
  $fpm_config_include_dir      = '/etc/php-fpm.d'
  $fpm_purge_conf_dir          = true
  $fpm_log_dir                 = '/var/log/php-fpm.d'
  $fpm_package_manage          = true
  $fpm_package_ensure          = 'present'
  $fpm_package_name            = 'php-fpm'
  $fpm_config_manage           = true
  
  $fpm_options_default_global  = {
    'error_log'                => '/var/log/php-fpm/global_error.log',
    'syslog.ident'             => 'php-fpm',
    'log_level'                => 'notice',
    'emergency_restart_threshold' => '0',
    'emergency_restart_interval'  => '0',
    'process_control_timeout'  => '0',
    'process.max'              => '128',
    'process.priority'         => '-19',
    'daemonize'                => 'no',
    'systemd_interval'         => '10',
  }
}