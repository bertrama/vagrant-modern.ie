# Copyright (c) 2015, Regents of the University of Michigan.
# All rights reserved. See LICENSE.txt for details.

# Inspired by https://gist.github.com/andreptb/57e388df5e881937e62a

# Pull the box_name from the environment, or the name of the directory you're in.
box_name = ENV.fetch('box_name', File.basename(File.dirname(__FILE__))).strip

# The box repository may be overridden. Defaults to http://aka.ms.
box_repo = ENV.fetch('box_repo', 'http://aka.ms').strip

Vagrant.configure("2") do |config|
  config.vm.box = box_name
  config.vm.box_url = box_repo + "/vagrant-" + box_name

  # Long boot timeout. Windows is slow.
  config.vm.boot_timeout = 500

  # Forward RDP.
  config.vm.network "forwarded_port", guest: 3389, host: 3389, id: "rdp", auto_correct: true, host_ip: "127.0.0.1"

  # Set it up for WinRM.
  config.vm.communicator = "winrm"
  config.winrm.username = "IEUser"
  config.winrm.password = "Passw0rd!"

  config.vm.provider "virtualbox" do |vb|

    # Run the VB GUI if needed.
    vb.gui = true if ENV.fetch('vb_gui', 'false').strip.downcase == 'true'

    # Set sensible defaults.
    vb.customize ["modifyvm", :id, "--memory", "1024"]
    vb.customize ["modifyvm", :id, "--vram", "128"]
    vb.customize ["modifyvm", :id,  "--cpus", "2"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 10000]
  end
end
