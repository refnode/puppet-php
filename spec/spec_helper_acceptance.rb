require 'beaker-rspec/spec_helper'
#require 'beaker-rspec/helpers/serverspec'
require 'json'

UNSUPPORTED_PLATFORMS = [ 'Windows', 'Solaris', 'AIX' ]

unless ENV['RS_PROVISION'] == 'no' or ENV['BEAKER_provision'] == 'no'
  # This will install the latest available package on el and deb based
  # systems fail on windows and osx, and install via gem on other *nixes
  foss_opts = { :default_action => 'gem_install' }

  if default.is_pe?; then install_pe; else install_puppet( foss_opts ); end

  hosts.each do |host|
    on hosts, "mkdir -p #{host['distmoduledir']}"
  end
end

RSpec.configure do |c|
  # Project root
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
  
  metadata_file = File.read('metadata.json')
  metadata = JSON.parse(metadata_file)
  puppet_module_name = metadata['name'].split('-')[1]

  # Readable test descriptions
  c.formatter = :documentation

  # Configure all nodes in nodeset
  c.before :suite do
    # Install module and dependencies
    puppet_module_install(:source => proj_root, :module_name => puppet_module_name)
    hosts.each do |host|
      # Required for binding tests.
      if fact('osfamily') == 'RedHat'
        version = fact("operatingsystemmajrelease")
        shell("yum localinstall -y http://yum.puppetlabs.com/puppetlabs-release-el-#{version}.noarch.rpm")
        if fact('operatingsystemmajrelease') =~ /7/ || fact('operatingsystem') =~ /Fedora/
          shell("yum install -y bzip2")
        end
      end

      shell("/bin/touch #{default['puppetpath']}/hiera.yaml")
      on host, puppet('module install puppetlabs-stdlib --version 3.2.0'), { :acceptable_exit_codes => [0,1] }
      on host, puppet('module','install','stahnma/epel'), { :acceptable_exit_codes => [0,1] }
    end
  end
end