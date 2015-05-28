require 'spec_helper'

describe 'php::fpm', :type => :class do
  context "on CentOS 7" do
    let :facts do
      {
        :id                        => 'root',
        :kernel                    => 'Linux',
        :osfamily                  => 'RedHat',
        :operatingsystem           => 'CentOS',
        :operatingsystemmajrelease => '7',
        :path                      => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
        :is_pe                     => false,
      }
    end
    it { is_expected.to contain_class("php::params") }
    it { is_expected.to contain_package("php-fpm").with(
      'ensure' => 'present'
      )
    }
    it { is_expected.to contain_file("/etc/php-fpm.d").with(
      'ensure'  => 'directory',
      'recurse' => 'true',
      'purge'   => 'true'
      )
    }
    it { is_expected.to contain_file("/var/log/php-fpm").with(
      'ensure'  => 'directory'
      )
    }
    it { is_expected.to contain_file("php-fpm-config-file").with(
      'path'    => '/etc/php-fpm.conf'
      )
    }
    it { is_expected.to contain_service("php-fpm").with(
      'ensure'  => 'running'
      )
    }
  end
end
