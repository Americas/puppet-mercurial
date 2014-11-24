# == Class: mercurial::params
#
# Define the parameters for mercurial.
#
# === Authors
#
# Ricardo Lopes <prplopes@gmail.com>
#
# === Copyright
#
# Copyright 2014 Ricardo Lopes
#
class mercurial::params {

	case $::osfamily {
		'Debian': {
			$package_name     = 'mercurial'
			$package_provider = 'apt'
			$conf_dir         = '/etc/mercurial'
			$conf_name        = 'hgrc'
		}
		default: {
      	fail("Unsupported osfamily: ${::osfamily} operatingsystem: ${::operatingsystem}, module ${module_name} only supports osfamily Debian")
    	}
	}

}