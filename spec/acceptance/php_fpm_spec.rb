require 'spec_helper_acceptance'

describe 'php::fpm class' do

  describe 'running puppet code' do
    # Using puppet_apply as a helper
    it 'should work with no errors' do
      tmpdir = default.tmpdir('php')
      pp = <<-EOS
        class { 'php::fpm': }
      EOS

      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end
  end
end

