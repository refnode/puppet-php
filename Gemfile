source 'https://rubygems.org'

puppetversion = ENV.key?('PUPPET_VERSION') ? "= #{ENV['PUPPET_VERSION']}" : ['>= 3.3']

  gem 'puppet', puppetversion
gem 'facter', '>= 1.7.0'

group :development, :unit_tests do
  gem 'rspec-core', '3.1.7',     :require => false
  gem 'puppetlabs_spec_helper', '>= 0.1.0'
  gem 'puppet-lint', '>= 0.3.2'
  gem 'json',                    :require => false
end

group :system_tests do
  gem 'beaker-rspec',  :require => false
  gem 'serverspec',    :require => false
end
