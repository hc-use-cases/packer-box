control 'operating_system' do
  describe command('lsb_release -a') do
    its('stdout') { should match (/Ubuntu/) }
  end
end

describe package('nginx') do
  it { should be_installed }
end

describe service('nginx') do
  it { should be_running }
end

describe service('nginx') do
  it { should be_enabled }
end

describe file('/etc/nginx') do
  it { should be_directory }
end

describe nginx do
  its('version') { should eq '1.14.0' }
end

describe nginx do
  its('support_info') { should match /TLS/ }
end