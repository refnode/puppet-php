# PRIVATE CLASS: do not use directly
class php::fpm::install {
  
  if $php::fpm::package_manage {

    package { 'php-fpm':
      ensure          => $php::fpm::package_ensure,
      name            => $php::fpm::package_name,
    }
  }
}