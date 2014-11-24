# Class: mercurial
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# class{'mercurial':
#   username    => "My Name <myself@me>",
#   auth_groups => [{
#     group     => 'default',
#     prefix    => 'URL',
#     username  => 'USERNAME',
#     password  => 'PASSWORD',
#     schemes   => 'http'
#   }]
# }
#
#
class mercurial(
  $username,
  $user_home = undef,
  $ensure   = 'present'
) inherits mercurial::params {

  if ! User[$username] {
    fail("User does not exist")
  }

  package { 'hg' :
    name     => $package_name,
    provider => $package_provider,
    ensure   => $ensure
  }

  file { 'hgrc':
    ensure  => file,
    path    => "${conf_dir}/${conf_name}",
    content => template('mercurial/hgrc.erb'),
    require => Package['hg'],
  }

  if $user_home {   
    file { 'user hgrc':
      ensure  => file,
      path    => "${user_home}/.${conf_name}",
      content => template('mercurial/u-hgrc.erb'),
      require => Package['hg'],
    }
  }

}