##
# Definitions for Macs
class hostname::darwin {
  $local_hostname = $hostname::hostname
  $local_domain = $hostname::domain

  exec { 'set computername':
    command => "/usr/sbin/scutil --set ComputerName ${local_hostname}",
    unless  => "test `scutil --get ComputerName` == '${local_hostname}'",
    require => Sudoers::Allowed_Command['hostname_scutil'],
  }

  exec { 'set hostname':
    command => "/usr/sbin/scutil --set HostName ${local_hostname}",
    unless  => "test `scutil --get HostName` == '${local_hostname}'",
    require => Sudoers::Allowed_Command['hostname_scutil'],
  }

  exec { 'set localhostname':
    command => "/usr/sbin/scutil --set LocalHostName ${local_hostname}",
    unless  => "test `scutil --get LocalHostName` == '${local_hostname}'",
    require => Sudoers::Allowed_Command['hostname_scutil'],
  }
}
