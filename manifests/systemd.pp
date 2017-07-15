##
# Definitions for systemd
class hostname::systemd {
  $local_hostname = $hostname::hostname
  $local_domain = $hostname::domain

  exec { 'set hostname':
    command => "hostnamectl set-hostname ${local_hostname}",
    unless  => "test `hostnamectl --static` == '${local_hostname}"
  }

  file { '/etc/hosts':
    ensure  => present,
    content => template('hostname/etc_hosts.erb')
  }
}
