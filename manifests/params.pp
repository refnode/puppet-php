# PRIVATE CLASS: do not use directly
class php::params {
  $fpm_config_file             = '/etc/php-fpm.conf'
  $fpm_config_include_dir      = '/etc/php-fpm.d'
  $fpm_purge_conf_dir          = true
  $fpm_log_dir                 = '/var/log/php-fpm'
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
  
  $fpm_options_default_instance = {
    'user'                      => 'apache',
    'group'                     => 'apache',
    'listen'                    => '127.0.0.1:9000',
    'listen.backlog'            => '-1',
    'listen.owner'              => 'nobody',
    'listen.group'              => 'nobody',
    'listen.mode'               => '0666',
    'listen.allowed_clients'    => '127.0.0.1',
    'pm'                        => 'dynamic',
    'pm.max_children'           => '50',
    'pm.start_servers'          => '5',
    'pm.min_spare_servers'      => '5',
    'pm.max_spare_servers'      => '35',
    'pm.process_idle_timeout'   => '10s',
    'pm.max_requests'           => 500,
    'pm.status_path'            => '/status',
    'ping.path'                 => '/ping',
    'ping.response'             => 'pong',
    'access.log'                => "${fpm_log_dir}/global_access.log",
    'access.format'             => '"%R - %u %t \"%m %r\" %s"',
    'slowlog'                   => "${fpm_log_dir}/global_slow.log",
    'request_slowlog_timeout'   => '0',
    'request_terminate_timeout' => '0',
    'chdir'                     => '/',
    'catch_workers_output'      => 'no',
    'security.limit_extensions' => '.php',
    'php_admin_value'           => {
      'error_log'               => "${fpm_log_dir}/global_error.log",
      'log_errors'              => 'on',
      'memory_limit'            => '128M',
    },
    'php_value'                 => {
      'session.save_handler'    => 'files',
      'session.save_path'       => '/var/lib/php/session',
    }
  }
}