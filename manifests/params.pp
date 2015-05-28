# PRIVATE CLASS: do not use directly
class php::params {
  $fpm_config_file             = '/etc/php-fpm.conf'
  $fpm_config_include_dir      = '/etc/php-fpm.d'
  $fpm_purge_conf_dir          = true
  $fpm_log_dir                 = '/var/log/php-fpm.d'
  $fpm_package_manage          = true
  $fpm_package_ensure          = 'present'
  $fpm_package_name            = 'php-fpm'
}