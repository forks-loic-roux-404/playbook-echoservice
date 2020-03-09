# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

current_dir      = File.dirname(File.expand_path(__FILE__))
yml              = YAML.load_file("#{current_dir}/config_env.yaml")
conf, vm         = yml['conf'], yml['vm']
os               = "bento/debian-" + conf['os']

Vagrant.configure(2) do |config|
   config.vm.box = os
  ## Install and configure software
  config.vm.provision "ansible_local" do |ansible|
      ansible.provisioning_path = "~/test_project"
      ansible.playbook = "playbook.yml"
      ansible.become = true
      ansible.verbose = ""
      ansible.extra_vars = conf
  end
end