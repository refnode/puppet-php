# php

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with php](#setup)
    * [What php affects](#what-php-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with php](#beginning-with-php)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This PHP module installs, configures and manages the PHP-FPM service and the
PHP command-line.

WARNING: The module is in alpha state

## Module Description

This PHP module installs, configures and manages the PHP-FPM service.

In future releases it will also provide

* installation and configuration for the PHP command-line tools
* an integrate of the Facebook HipHop virtual machine as alternative to PHP-FPM

## Setup

### What php affects

* A list of files, packages, services, or operations that the module will alter,
  impact, or execute on the system it's installed on.
* This is a great place to stick any warnings.
* Can be in list or paragraph form.

### Setup Requirements **OPTIONAL**

If your module requires anything extra before setting up (pluginsync enabled,
etc.), mention it here.

### Beginning with php

The very basic steps needed for a user to get the module up and running.

If your most recent release breaks compatibility or requires particular steps
for upgrading, you may wish to include an additional section here: Upgrading
(For an example, see http://forge.puppetlabs.com/puppetlabs/firewall).

## Usage

Put the classes, types, and resources for customizing, configuring, and doing
the fancy stuff with your module here.

## Reference

###Classes

####Public classes
* `php::fpm`: Installs and configures PHP-FPM Service.

####Private classes
* `php::fpm::install`: Installs the PHP-FPM packages.
* `php::fpm::config`: Configures global configuration and central directories.
* `php::fpm::instance_default`: Generates a default PHP-FPM instance using php::fpm_instance.
* `php::fpm::service`: Deletes default Manages the PHP-FPM service.

###Defined Types

####php::fpm_instance

###Parameters

####php::fpm

#####`config_file`

The path of the central PHP-FPM configuration file.

#####`include_dir`

The path of the PHP-FPM include_dir. The include_dir is the place for storing the FPM instance
pool configuration files.

#####`purge_conf_dir`

Wether the include_dir should be purged. Valid values are 'true', 'false'. Defaults to 'true'.

When set to 'true', only FPM instance pool configurations files managed by Puppet are stored.

#####`log_dir`

The path of the central and pool instance logs.

#####`override_options`

The hash of override options to pass into the global PHP-FPM configuration file.
The hash is merged together with defaults from params.pp into a final options hash.

~~~
$override_options = {
  'item'             => 'thing',
}
~~~


#####`package_manage`

Whether to manage the PHP-FPM package. Defaults to true.

#####`package_ensure`

Whether the package exists or should be a specific version.
Valid values are 'present', 'absent', or 'x.y.z'. Defaults to 'present'.

#####`package_name`

The name of the PHP-FPM package to install. Defaults are OS dependent, defined in params.pp.

#####`config_manage`

Whether to manage the PHP-FPM global configuration. Defaults to true.

#####`service_manage`

Whether to manage the PHP-FPM service. Defaults to true.

#####`service_name`

The name of the PHP-FPM service. Defaults are OS dependent, defined in params.pp.

#####`service_enable`

Whether the PHP-FPM service should be enabled. Valid values are 'true', 'false'. Defaults to 'true'.

####php::fpm_instance

#####`ensure`
#####`override_options`


## Limitations

This module has been tested on:

* CentOS 7

## Development

The rules for contributing ot this module are as close to the Puppet Labs module
contribution guide as possible.

Check out the complete [module contribution guide](https://docs.puppetlabs.com/forge/contributing.html).

## Release Notes/Contributors/Etc **Optional**

If you aren't using changelog, put your release notes here (though you should
consider using changelog). You may also add any additional sections you feel are
necessary or important to include here. Please use the `## ` header.

### Authors

This module is heavy inspired by the style of puppetlabs-mysql. The following contributors have contributed to this module:
