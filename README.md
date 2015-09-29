# Vagrant boxes from modern.ie

[Modern.ie](https://www.modern.ie/) has provided [vagrant boxes](http://blog.syntaxc4.net/post/2014/09/03/windows-boxes-for-vagrant-courtesy-of-modern-ie.aspx).  Some people like to use WinRM, this process explains how to set that up. Also explains how to activate the box on the umich KMS.

1. Clone this repo.
2. In your clone, run vagrant up with the right environment variables:
  * `vb_gui="true" box_name="win7-ie10" vagrant up`
3. Wait for windows to load.
4. Set the Network to "Home" or "Work".
5. Browse your network for the vagrant share.
6. Run setup.bat.
7. Run umich-kms-old.bat if the box is Vista.
8. Run umich-kms-new.bat if the box is Win7 or later.
9. Shut down.
10. Repackage if needed:
  * `vagrant package --output ../win7-ie10.box --Vagrantfile Vagrantfile`
