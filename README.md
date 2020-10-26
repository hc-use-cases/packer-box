# packer-box
Packer box example with ansible


## Pre-requirements 
- [packer](https://www.packer.io/)
- [vagrant](https://www.vagrantup.com/)
- [kitchent-test](https://kitchen.ci/)
- [virtualbox](https://www.virtualbox.org/)
- [ansible](https://docs.ansible.com/ansible/latest/index.html)

## How to use it
```bash
git@github.com:hc-use-cases/packer-box.git
cd packer-box
```
validate the packer template
```bash
packer validate template.pkr.hcl
```

build packer box
```bash
packer build template.pkr.hcl
```

add the box to vagrant
```bash
vagrant box add --name bionic64 --provider virtualbox bionic64.box 
```

## Configuration management
```bash
provisioner "ansible-local" {
  playbook_file   = "ansible/web-server.yml"
}
```

This packer template use ansible [provisioner](https://www.packer.io/docs/provisioners/ansible-local) which permit using ansible playbooks to deploy/configure software or/and the OS.

## Testing

configure ruby enviroment 

```ruby
rbenv install 2.3.1
rbenv local 2.3.1
rbenv versions
gem install bundler
bundle install
```

run the tests
```bash
bundle exec kitchen converge
bundle exec kitchen verify
bundle exec kitchen destroy
```

### Test results

once tests were executed successfully you'll get similar output
```bash
# ...
Target:  ssh://vagrant@127.0.0.1:2222

  ✔  operating_system: Command: `lsb_release -a`
     ✔  Command: `lsb_release -a` stdout is expected to match /Ubuntu/

  System Package nginx
     ✔  is expected to be installed
  Service nginx
     ✔  is expected to be running
  Service nginx
     ✔  is expected to be enabled
  File /etc/nginx
     ✔  is expected to be directory
  Nginx Environment
     ✔  version is expected to eq "1.14.0"
  Nginx Environment
     ✔  support_info is expected to match /TLS/

Profile Summary: 1 successful control, 0 control failures, 0 controls skipped
Test Summary: 7 successful, 0 failures, 0 skipped
# ...
```