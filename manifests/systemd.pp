##
# Definitions for systemd
class hostname::systemd {
  $local_hostname = $hostname::hostname
  $local_domain = $hostname::domain

  exec { 'set hostname':
    command => "hostnamectl set-hostname ${local_hostname}",
    unless  => "test `hostnamectl --static` == '${local_hostname}'",
    path    => ['/usr/bin', '/bin'],
  }

  file { '/etc/hosts':
    ensure  => file,
    content => template('hostname/etc_hosts.erb'),
  }
}
