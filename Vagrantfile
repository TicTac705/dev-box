# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'json'
require 'yaml'

VAGRANTFILE_API_VERSION ||= "2"
confDir = $confDir ||= File.expand_path("vendor/laravel/homestead", File.dirname(__FILE__))

homesteadYamlPath = "Homestead.yaml"
homesteadJsonPath = "Homestead.json"
afterScriptPath = "after.sh"
customizationScriptPath = "user-customizations.sh"
aliasesPath = "aliases"

require File.expand_path(confDir + '/scripts/homestead.rb')

Vagrant.require_version '>= 2.2.4'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    if File.exist? aliasesPath then
        config.vm.provision "file", source: aliasesPath, destination: "/tmp/bash_aliases"
        config.vm.provision "handle_aliases", type: "shell" do |s|
            s.inline = "awk '{ sub(\"\r$\", \"\"); print }' /tmp/bash_aliases > /home/vagrant/.bash_aliases && chown vagrant:vagrant /home/vagrant/.bash_aliases"
        end
    end

    if File.exist? homesteadYamlPath then
        settings = YAML::load(File.read(homesteadYamlPath))
    elsif File.exist? homesteadJsonPath then
        settings = JSON::parse(File.read(homesteadJsonPath))
    else
        abort "Homestead settings file not found in #{confDir}"
    end

    Homestead.configure(config, settings)

    if File.exist? afterScriptPath then
        config.vm.provision "Run after.sh", type: "shell", path: afterScriptPath, privileged: false, keep_color: true
    end

    if File.exist? customizationScriptPath then
        config.vm.provision "Run customize script", type: "shell", path: customizationScriptPath, privileged: false, keep_color: true
    end

    if Vagrant.has_plugin?('vagrant-hostsupdater')
        config.hostsupdater.remove_on_suspend = false
        config.hostsupdater.aliases = settings['sites'].map { |site| site['map'] }
    elsif Vagrant.has_plugin?('vagrant-hostmanager')
        config.hostmanager.enabled = true
        config.hostmanager.manage_host = true
        config.hostmanager.aliases = settings['sites'].map { |site| site['map'] }
    elsif Vagrant.has_plugin?('vagrant-goodhosts')
        config.goodhosts.aliases = settings['sites'].map { |site| site['map'] }
    end

    if Vagrant.has_plugin?('vagrant-notify-forwarder')
        config.notify_forwarder.enable = true
    end

    # config.vm.provider :virtualbox do |vb|
    #     vb.gui = true
    # end

    config.vm.boot_timeout = 600

    config.vm.network "forwarded_port", guest: 27017, host: 27017
end