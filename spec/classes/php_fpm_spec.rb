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
  end
end
